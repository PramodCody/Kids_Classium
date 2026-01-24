extends Control
@onready var Background1 = %Lessons_Collection
@onready var Background2 = %Toggle_Buttons
@onready var Popups_Collection = %Popups_Collection
@onready var popup_Numbers_Collection = %popup_Numbers_Collection

func _on__button_down() -> void:
	pass
func _on__button_up() -> void:
	Popups_Collection.visible = true
	popup_Numbers_Collection.visible = true
