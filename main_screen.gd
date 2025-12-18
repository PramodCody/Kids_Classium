extends Control

#for Elastic Play
func _process(delta: float) -> void:
	pass

func _on_play_button_pressed() -> void:
	var new_font_size = $Play_Button.get_theme_font_size("font_size")
	new_font_size -= 10
	$Play_Button.add_theme_font_size_override("font_size", new_font_size)
		
	$Button_Sound.play()
	await $Button_Sound.finished
	
	get_tree().change_scene_to_file("res://test_scene.tscn")


func _on_levels_button_pressed() -> void:
	var new_font_size = $Levels_Button.get_theme_font_size("font_size")
	new_font_size -= 5
	
	$Button_Sound.play()
	$Levels_Button.add_theme_font_size_override("font_size", new_font_size)
	await $Button_Sound.finished


func _on_exit_button_pressed() -> void:
	var new_font_size = $Exit_Button.get_theme_font_size("font_size")
	new_font_size -= 5
	
	$Button_Sound.play()
	$Exit_Button.add_theme_font_size_override("font_size", new_font_size)
	await $Button_Sound.finished
	
	get_tree().quit()
