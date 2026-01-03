extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Trace_Game/scenes/Tracing_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Pop_Game/scenes/Poping_1.tscn")
