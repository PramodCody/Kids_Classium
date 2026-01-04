extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://02_Trace_Game/scenes/Tracing_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://03_Pop_Game/scenes/Poping_1.tscn")
