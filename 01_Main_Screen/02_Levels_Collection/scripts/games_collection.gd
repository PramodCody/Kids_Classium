extends Control
signal which_route(route: String)
@onready var Trace_Game = $GridContainer/Trace
@onready var Pop_Game = $GridContainer/Pop
@onready var Collect_Game = $GridContainer/Collect
@onready var Hide_Seek_Game = $GridContainer/HideSeek
@onready var Drag_Drop_Game = $GridContainer/DragDrop

@onready var Popups_Collection = %Popups_Collection
@onready var popups_Lessons_Collection = %popup_Lessons_Collection

func _on_trace_button_down() -> void:
	pass
func _on_trace_button_up() -> void:
	which_route.emit("Trace_Game")
	Popups_Collection.visible = true
	popups_Lessons_Collection.visible = true


func _on_pop_button_down() -> void:
	pass # Replace with function body.
func _on_pop_button_up() -> void:
	which_route.emit("Pop_Game")
	Popups_Collection.visible = true
	popups_Lessons_Collection.visible = true


func _on_collect_button_down() -> void:
	pass # Replace with function body.
func _on_collect_button_up() -> void:
	which_route.emit("Collect_Game")
	Popups_Collection.visible = true
	popups_Lessons_Collection.visible = true


func _on_hide_seek_button_down() -> void:
	pass # Replace with function body.
func _on_hide_seek_button_up() -> void:
	which_route.emit("HideSeek_Game")
	Popups_Collection.visible = true
	popups_Lessons_Collection.visible = true


func _on_drag_drop_button_down() -> void:
	pass # Replace with function body.
func _on_drag_drop_button_up() -> void:
	which_route.emit("DragDrop_Game")
	Popups_Collection.visible = true
	popups_Lessons_Collection.visible = true
