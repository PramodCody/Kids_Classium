extends Control

func _on_button_1_button_down() -> void:
	pass
func _on_button_1_button_up() -> void:
	GlobalVariables.lesson_route_selected_number = 1
	FadeAnimation.change_scene("res://02_Trace_Game/scenes/Tracing_1.tscn")

#func _on_button_pressed(number: int):
	#PopupNumbers.selected_number = number  # Store it
	#get_tree().change_scene_to_file("res://your_main_scene.tscn")  # Change scene


@onready var Popups_Colllection = %Popups_Collection
@onready var popup_Numbers_Collection = %popup_Numbers_Collection
func _on_back_button_button_up() -> void:
	popup_Numbers_Collection.visible = false
	Popups_Colllection.visible = false
