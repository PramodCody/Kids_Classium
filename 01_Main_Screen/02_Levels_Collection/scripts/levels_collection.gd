extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://02_Trace_Game/scenes/Tracing_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://03_Pop_Game/scenes/Poping_1.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://04_Collect_Game/scenes/collecting_1.tscn")


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://05_Hide&Seek_Game/scenes/seeking_1.tscn")


func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://06_Drag&Drop_Game/scene/dragging_1.tscn")
