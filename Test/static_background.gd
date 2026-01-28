extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Test/static_background.tscn")


func _on_button_2_pressed() -> void:
	print("next_scene")
