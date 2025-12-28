extends Path2D

@onready var line = $Line2D
@onready var area = $"../Area2D"

var current_point_index = 0
var is_tracing = false

func check_tracing(global_pos: Vector2):
	# Convert global position to Path2D's local space
	var local_pos = to_local(global_pos)
	var target_point = curve.get_closest_point(local_pos)
	
	if local_pos.distance_to(target_point) < 100:
		line.add_point(target_point)
		current_point_index += 1


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		check_tracing(event.position)
