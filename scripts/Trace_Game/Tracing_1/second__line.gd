extends Path2D

@onready var line = $Line2D
@onready var Tracing_Sound = $"../../Drawing_Sound_second"
var isDrawing_Sound_enable : bool

var is_tracing : bool = false

var current_point_index = 0
var second_line_curve = $".".curve
var second_line_point_count = second_line_curve.get_point_count()

var is_second_line_start_point_completed = false
var is_second_line_end_point_completed = false

func check_tracing(global_pos: Vector2):
	# Convert global position to Path2D's local space
	var local_pos = to_local(global_pos)
	var target_point = curve.get_closest_point(local_pos)
	var second_line_first_point = second_line_curve.get_point_position(0)
	var second_line_end_point = second_line_curve.get_point_position(second_line_point_count - 1)
	
	if local_pos.distance_to(target_point) < 100:
		isDrawing_Sound_enable = true
		
		if local_pos.distance_to(second_line_first_point) < 100:
			line.add_point(second_line_first_point)
			is_second_line_start_point_completed = true
		if local_pos.distance_to(second_line_end_point) < 100:
			line.add_point(second_line_end_point)
			is_second_line_end_point_completed = true
			
		line.add_point(target_point)
		current_point_index += 1

		if is_second_line_start_point_completed and is_second_line_end_point_completed:
			is_tracing = false
			$"../../Retry_Button".show_with_fade()
			$"../../Next_Button".show_with_fade()
			isDrawing_Sound_enable = false


func _input(event: InputEvent) -> void:
	if is_tracing:
		if event is InputEventScreenTouch or event is InputEventScreenDrag:
			check_tracing(event.position)
			
			if event is InputEventScreenDrag and isDrawing_Sound_enable:
				if !Tracing_Sound.playing:
					Tracing_Sound.play()
			elif Tracing_Sound.playing:
				Tracing_Sound.stop()


func _on_first_line_tracing_changed(is_second_line_tracing: Variant) -> void:
	is_tracing = true
