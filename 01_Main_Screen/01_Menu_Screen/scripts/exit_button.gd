extends TextureButton
@onready var Menu_Screen = %TextureRect
@onready var Canvas_Layer = %Dialog_Group
@onready var Exit_Dialog_Layer = %Exit_Dialog


func Tween_Background_Out_Focus():
	var tween = create_tween()
	tween.tween_property(Menu_Screen, "modulate", Color(0.4, 0.4, 0.4, 1), 0.5)
func Exit_Dialog_In():
	Canvas_Layer.visible = true
	Exit_Dialog_Layer.modulate.a = 0
	var tween = create_tween()
	tween.tween_property(Exit_Dialog_Layer, "modulate:a", 1.0, 0.8)
	tween.set_trans(Tween.TRANS_SINE)



var scale_strength = 0.1
var animation_speed = 0.1
func _on_button_down() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await AudioManager.Button_Sound.finished

func _on_button_up() -> void:
	
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	
	await AudioManager.Button_Sound.finished
	Tween_Background_Out_Focus()
	Exit_Dialog_In()
