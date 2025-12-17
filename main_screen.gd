extends Control


func _on_play_button_pressed() -> void:
	$Button_Sound.play()
	$Play_Button.add_theme_font_size_override("font_size", 195)	
	await $Button_Sound.finished
	get_tree().change_scene_to_file("res://test_scene.tscn")


func _on_levels_button_pressed() -> void:
	$Button_Sound.play()
	$Levels_Button.add_theme_font_size_override("font_size", 195)
	await $Button_Sound.finished



func _on_exit_button_pressed() -> void:
	$Button_Sound.play()
	$Exit_Button.add_theme_font_size_override("font_size", 195)
	await $Button_Sound.finished
