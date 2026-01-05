extends Control

var star_template = preload("res://04_Collect_Game/commons/twinkle_star.tscn")
var is_star_collided : bool

func spawn_star():
	var new_star = star_template.instantiate()
	add_child(new_star)
	new_star.position = Vector2(2200, 500)

func _ready() -> void:
	spawn_star()
