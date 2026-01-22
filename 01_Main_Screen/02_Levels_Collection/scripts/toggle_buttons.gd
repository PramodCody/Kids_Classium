extends HBoxContainer

@onready var toggle_Lessons = %toggle_Lessons
@onready var Lessons_Collection = %Lessons_Collection

@onready var toggle_Games = %toggle_Games
@onready var Games_Collection = %Games_Collection

@onready var Popups_Collection = %Popups_Collection

#func visible_invisible():
	#if Lessons_Collection.visible == false:
		#Lessons_Collection.visible = true
	#elif Games_Collection.visible == false:
		#Games_Collection.visible = true

func _ready() -> void:
	Popups_Collection.visible = false
	Games_Collection.visible = false
	Lessons_Collection.visible = true

func _on_toggle_lessons_toggled(toggled_on: bool) -> void:
	Lessons_Collection.visible = true
	Games_Collection.visible = false


func _on_toggle_games_toggled(toggled_on: bool) -> void:
	Lessons_Collection.visible = false
	Games_Collection.visible = true
