extends Control
@onready var Games_Collection = %Games_Collection
var scene : String

func _on_games_collection_which_route(route: String) -> void:
	if route == "Trace_Game":
		scene = "res://02_Trace_Game/scenes/Tracing_1.tscn"
	if route == "Pop_Game":
		scene = "res://03_Pop_Game/scenes/Poping_1.tscn"
	if route == "Collect_Game":
		scene = "res://04_Collect_Game/scenes/collecting_1.tscn"
	elif route == "HideSeek_Game":
		scene = "res://05_Hide&Seek_Game/scenes/seeking_1.tscn"
	elif route == "DragDrop_Game":
		scene = "res://06_Drag&Drop_Game/scene/dragging_1.tscn"
func _ready() -> void:
	Games_Collection.which_route.connect(_on_games_collection_which_route)

#123
func _on__button_down() -> void:
	pass
func _on__button_up() -> void:
	FadeAnimation.change_scene(scene)

@onready var Popups_Colllection = %Popups_Collection
@onready var popup_Lessons_Collection = %popup_Lessons_Collection
func _on_back_button_button_up() -> void:
	popup_Lessons_Collection.visible = false
	Popups_Colllection.visible = false
