extends Control

var bubble_template = preload("res://Pop_Game/commons/bubble_pop.tscn")

func _ready() -> void:
	spawn_bubble()
	spawn_bubble()
	spawn_bubble()

func spawn_bubble():
	var new_bubble = bubble_template.instantiate()
	add_child(new_bubble)
	new_bubble.poped.connect(on_bubble_poped)


func on_bubble_poped():
	spawn_bubble() #whichever pops appears again
