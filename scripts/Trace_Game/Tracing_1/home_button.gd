extends TextureButton

var scale_strength = 0.1
var animation_speed = 0.1


func _on_button_down() -> void:
	$"../Button_Sound".play()
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	await $"../Button_Sound".finished


func _on_button_up() -> void:
	$"../Button_Sound".play()
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	
	await $"../Button_Sound".finished
	get_tree().change_scene_to_file("res://scenes/Main_Screen/main_screen.tscn")
