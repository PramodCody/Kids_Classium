extends Control
@onready var Background1 = %Lessons_Collection
@onready var Background2 = %Toggle_Buttons
@onready var Popups_Collection = %Popups_Collection
@onready var popup_Numbers_Collection = %popup_Numbers_Collection

func _on__button_down() -> void:
	pass
func _on__button_up() -> void:
	Popups_Collection.visible = true
	Background_Out_Focus()
	popup_Numbers_Collection.visible = true
	
func Background_Out_Focus():
	var tween1 = create_tween()
	tween1.tween_property(Background1, "modulate", Color(0.4, 0.4, 0.4, 1), 0.5)
	var tween2 = create_tween()
	tween2.tween_property(Background2, "modulate", Color(0.4, 0.4, 0.4, 1), 0.5)
	
