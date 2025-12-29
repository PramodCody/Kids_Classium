extends Path2D

@onready var line = $Line2D

signal tracing_changed(is_second_line_tracing)
var is_second_line_tracing = false

var is_tracing : bool = true

var current_point_index = 0
var first_line_curve = $".".curve
var first_line_point_count = first_line_curve.get_point_count()

var is_first_line_first_point_completed = false
#var is_first_line_end_point_completed = false

func check_tracing(global_pos: Vector2):
	# Convert global position to Path2D's local space
	var local_pos = to_local(global_pos)
	var target_point = curve.get_closest_point(local_pos)
	var first_line_first_point = first_line_curve.get_point_position(0)
	var first_line_end_point = first_line_curve.get_point_position(first_line_point_count - 1)
	
	if local_pos.distance_to(target_point) < 100:
		line.add_point(target_point)
		current_point_index += 1
		
		if target_point == first_line_first_point:
			is_first_line_first_point_completed = true
			
		if target_point == first_line_end_point and is_first_line_first_point_completed:
			print("first_line_completed")
			is_tracing = false
			is_second_line_tracing = true
			tracing_changed.emit(is_second_line_tracing)


func _input(event: InputEvent) -> void:
	if is_tracing:
		if event is InputEventScreenTouch or event is InputEventScreenDrag:
			check_tracing(event.position)
