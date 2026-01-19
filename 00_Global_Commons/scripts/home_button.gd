extends TextureButton

var scale_strength = 0.08
var animation_speed = 0.08


func _on_button_down() -> void:
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	


func _on_button_up() -> void:
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	get_tree().change_scene_to_file("res://01_Main_Screen/01_Menu_Screen/scenes/menu_screen.tscn")

	#tween.parallel().tween_callback(change_my_scene).set_delay(0.1)
	#await get_tree().create_timer(0.15).timeout
	

#func change_my_scene():
