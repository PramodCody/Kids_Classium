extends Sprite2D

@export var Number : int
@export var Mission_Position : Vector2
signal mission_Completed

var isPressed = false
var is_Mission_Accomplished = false

func get_random_position() -> Vector2:
	# 1. Define all your forbidden rectangles in an Array
	var forbidden_zones = [
		Rect2(950, 290, 500, 500),   # Zone 1  #Position (1000,460), Size (400,160)
		Rect2(66, 20, 250, 250),   # Zone 2
	]
	
	var pos = Vector2.ZERO
	var is_invalid = true
	
	# 2. Keep picking a new position until it is safe from ALL zones
	while is_invalid:
		# Pick a random point
		pos = Vector2(randf_range(100, 2100), randf_range(50, 1030))
		
		# Assume it's valid until proven otherwise
		is_invalid = false
		
		# Check against every rectangle in the array
		for rect in forbidden_zones:
			if rect.has_point(pos):
				is_invalid = true # It hit a box!
				break # Stop checking other boxes, pick a new position and restart loop
				
	return pos

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		isPressed = true
		
	if !is_Mission_Accomplished:
		if event is InputEventScreenDrag and isPressed:
			position = event.position
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Mission_Area":
		var random_pos = get_random_position()
		if Number == 1:
			position = Vector2(randf_range(1180, 1220), 540)
			is_Mission_Accomplished = true
			mission_Completed.emit()
		else:
			position = random_pos
