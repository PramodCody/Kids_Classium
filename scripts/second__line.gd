extends Path2D

@onready var line = $Line2D

var is_tracing : bool = false

var current_point_index = 0
var second_line_curve = $".".curve
var second_line_point_count = second_line_curve.get_point_count()
var is_second_line_first_point_completed = false

func check_tracing(global_pos: Vector2):
	# Convert global position to Path2D's local space
	var local_pos = to_local(global_pos)
	var target_point = curve.get_closest_point(local_pos)
	var second_line_first_point = second_line_curve.get_point_position(0)
	var second_line_end_point = second_line_curve.get_point_position(second_line_point_count - 1)
	
	if local_pos.distance_to(target_point) < 100:
		line.add_point(target_point)
		current_point_index += 1
		
		if target_point == second_line_first_point:
			is_second_line_first_point_completed = true

		if target_point == second_line_end_point and is_second_line_first_point_completed:
			print("second_line_completed")
			is_tracing = false
			await get_tree().create_timer(2).timeout
			$"../../Retry_Button".visible = true
			$"../../Next_Button".visible = true

func _input(event: InputEvent) -> void:
	if is_tracing:
		if event is InputEventScreenTouch or event is InputEventScreenDrag:
			check_tracing(event.position)


func _on_first_line_tracing_changed(is_second_line_tracing: Variant) -> void:
	await get_tree().create_timer(1.5).timeout
	is_tracing = true
