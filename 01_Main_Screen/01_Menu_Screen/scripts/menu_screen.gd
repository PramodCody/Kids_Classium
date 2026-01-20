extends Control
@onready var Menu_Screen = $TextureRect
@onready var Canvas_Layer = %Dialog_Group
@onready var Exit_Dialog_Layer = %Exit_Dialog

func Tween_Background_Out_Focus():
	var tween = create_tween()
	tween.tween_property(Menu_Screen, "modulate", Color(0.1, 0.1, 0.1, 1), 0.5)
func Exit_Dialog_In():
	Canvas_Layer.visible = true
	Exit_Dialog_Layer.modulate.a = 0
	var tween = create_tween()
	tween.tween_property(Exit_Dialog_Layer, "modulate:a", 1.0, 0.8)
	tween.set_trans(Tween.TRANS_SINE)
	

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		Tween_Background_Out_Focus()
		Exit_Dialog_In()


func _on_margin_container_bottom_panel_changed(margin_value: Variant) -> void:
	var old_size_y = %Bottom_Panel.size.y
	var current_size_y = old_size_y + margin_value
	%Bottom_Panel.size.y = current_size_y
