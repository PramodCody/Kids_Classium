extends Control

var total_angle = deg_to_rad(0)
var previous_angle = deg_to_rad(0)
var start_angle
var end_angle
var point1 = Vector2(1500, 540)
var point2 = Vector2(1500, 540)
var clockwise = false

func  is_clockwise():
	var angle_diffn = angle_difference(previous_angle, end_angle)
	if angle_diffn >= 0:
		total_angle += angle_diffn
		clockwise = true
	else:
		previous_angle = end_angle
		angle_diffn = 0

	
	
	
	

#func is_clockwise():
	#var angle_diffn = angle_difference(previous_angle, end_angle)
	#if angle_diffn >= 0:
		#clockwise = true
	#

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		point2 = event.position
		queue_redraw()

func _draw() -> void:
	draw_circle(Vector2(1200, 540), 290, Color.GREEN)
	draw_circle(Vector2(1525, 540), 25, Color.BLACK)
	
	#Constants
	var center = Vector2(1200, 540)
	var radius = 300
	start_angle = deg_to_rad(0)
	var segments = 100
	var color = Color.RED
	var width = 50
	
	#Need to Play with
	end_angle = (point2-center).angle()
	is_clockwise()
	if clockwise:
		draw_arc(center, radius, start_angle, total_angle, segments, color, width)
	else:
		total_angle = deg_to_rad(0)
	
	
	
