extends Control
@onready var Level_Control = $Level_Control
var is_Mission_Area2d_Entered : bool
var mission_counter = 0

var zero_template = preload("res://06_Drag&Drop_Game/commons/zero.tscn")
var one_template = preload("res://06_Drag&Drop_Game/commons/one.tscn")
var two_template = preload("res://06_Drag&Drop_Game/commons/two.tscn")

#func get_random_position() -> Vector2:
	#var forbidden_rect = Rect2(950, 290, 500, 500) # Position (1000,460), Size (400,160)
	#var pos = Vector2(randf_range(100, 2100), randf_range(50, 1030))
	#
	## If the point is inside the rect, try again (recursion)
	#if forbidden_rect.has_point(pos):
		#return get_random_position()
		#
	#return pos

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

func spawn_zero():
	var new_zero = zero_template.instantiate()
	add_child(new_zero)
	var random_pos = get_random_position()
	new_zero.position = random_pos

func spawn_one():
	var new_one = one_template.instantiate()
	add_child(new_one)
	var random_pos = get_random_position()
	new_one.position = random_pos
	new_one.mission_Completed.connect(on_mission_accomplished)


func spawn_two():
	var new_two = two_template.instantiate()
	add_child(new_two)
	var random_pos = get_random_position()
	new_two.position = random_pos

func _ready() -> void:
	for i in 3:
		spawn_zero()
		spawn_one()
		spawn_two()

func on_mission_accomplished():
	mission_counter += 1
	if mission_counter == 3:
		Level_Control.show_with_fade("retry")
		Level_Control.show_with_fade("next")
