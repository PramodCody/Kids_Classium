extends Control

@onready var Button_Sound = $Button_Sound
@onready var Menu_Screen = %TextureRect
@onready var Canvas_Layer = %Dialog_Group
@onready var Exit_Dialog_Layer = %Exit_Dialog

func Tween_Bacground_In_Focus():
	var tween = create_tween()
	tween.tween_property(Menu_Screen, "modulate", Color(1, 1, 1, 1), 0.5)
func Exit_Dialog_Out():
	Exit_Dialog_Layer.modulate.a = 1
	var tween = create_tween()
	tween.tween_property(Exit_Dialog_Layer, "modulate:a", 0, 0.8)
	tween.set_trans(Tween.TRANS_SINE)
	Canvas_Layer.visible = false


func _on_yes_button_button_down() -> void:
	Button_Sound.play()
	await Button_Sound.finished
	get_tree().quit()
func _on_no_button_button_down() -> void:
	Button_Sound.play()
	await Button_Sound.finished
	Tween_Bacground_In_Focus()
	Exit_Dialog_Out()
