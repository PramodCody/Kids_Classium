extends Path2D

@onready var line = $Line2D
@onready var Tracing_Sound = $"../../Drawing_Sound_first"

signal tracing_changed(is_second_line_tracing)
var is_second_line_tracing = false

var is_tracing : bool

var current_point_index = 0
var first_line_curve = $".".curve
var first_line_point_count = first_line_curve.get_point_count()
var first_line_start_point = first_line_curve.get_point_position(0)
var first_line_end_point = first_line_curve.get_point_position(first_line_point_count - 1)

var is_first_line_start_point_completed = false
var is_first_line_end_point_completed = false

func check_tracing(global_pos: Vector2):
	# Convert global position to Path2D's local space
	var local_pos = to_local(global_pos)
	var target_point = curve.get_closest_point(local_pos)
	
	
	if local_pos.distance_to(target_point) < 100:
		is_tracing = true

		if local_pos.distance_to(first_line_start_point) < 100:
			line.add_point(first_line_start_point)
			is_first_line_start_point_completed = true
		if local_pos.distance_to(first_line_end_point) < 100:
			line.add_point(first_line_end_point)
			is_first_line_end_point_completed = true
			
		if is_first_line_start_point_completed:
			line.add_point(target_point)
			current_point_index += 1



		if is_first_line_start_point_completed and is_first_line_end_point_completed:
			is_tracing = false
			
			is_second_line_tracing = true
			tracing_changed.emit(is_second_line_tracing)


func _input(event: InputEvent) -> void:
	var first_line_start_point_global = to_global(first_line_start_point)
	if event.position.distance_to(first_line_start_point_global) < 100:
		is_tracing = true
	
	if is_tracing:
		if event is InputEventScreenTouch or event is InputEventScreenDrag:
			check_tracing(event.position)
		
			if event is InputEventScreenDrag and is_tracing:
				if !Tracing_Sound.playing:
					Tracing_Sound.play()
			elif Tracing_Sound.playing:
				Tracing_Sound.stop()
