extends Path2D

@onready var line = $Line2D
var points_to_trace = []
var current_point_index = 0

func check_tracing(pos):
	if current_point_index < points_to_trace.size():
		var target_point = points_to_trace[current_point_index]
		
		if pos.distance_to(target_point) < 20:
			line.add_point(target_point)
			current_point_index += 1


func _ready() -> void:
	points_to_trace = curve.get_baked_points()

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		var touch_pos = to_local(event.position)
		check_tracing(touch_pos)
		
