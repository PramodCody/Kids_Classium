extends Control

func _draw() -> void:
	
	#the lines
	var color = Color.RED
	var width = 10.0
	draw_line(Vector2(1000, 700), Vector2(1000, 380), color, width)
	draw_line(Vector2(1100, 700), Vector2(1100, 380), color, width)
	# Fill white color between the lines
	var fill_left_lines = PackedVector2Array([
		Vector2(1000, 700),  # Bottom left
   		Vector2(1100, 700),  # Bottom right
		#use toucharea to confirm the touch is in right position and then increase the y accordinglyy
		Vector2(1100, 450),  # Top right #380 (y) for complete fill.
		Vector2(1000, 450)   # Top left
])
	draw_colored_polygon(fill_left_lines, Color.WHITE)

	draw_line(Vector2(1300, 700), Vector2(1300, 380), color, width)
	draw_line(Vector2(1400, 700), Vector2(1400, 380), color, width)
	
	#the curves
	#bottom
	var curve1 = Curve2D.new()
	curve1.add_point(Vector2(1000, 700), Vector2.ZERO, Vector2(0, 200))
	curve1.add_point(Vector2(1200, 900), Vector2(0, 0), Vector2(0, 0))
	curve1.add_point(Vector2(1400, 700), Vector2(0, 200), Vector2.ZERO)
	var line1 = Line2D.new()
	line1.points = curve1.get_baked_points()
	line1.width = 8
	add_child(line1)
	#second bottom
	var curve2 = Curve2D.new()
	curve2.add_point(Vector2(1100, 700), Vector2.ZERO, Vector2(0, 100))
	curve2.add_point(Vector2(1200, 800), Vector2(0, 0), Vector2(0, 0))
	curve2.add_point(Vector2(1300, 700), Vector2(0, 100), Vector2.ZERO)
	var line2 = Line2D.new()
	line2.points = curve2.get_baked_points()
	line2.width = 8
	add_child(line2)
	
	
	# Fill between the curves
	var fill_polygon = Polygon2D.new()
	var fill_bottom_curve = PackedVector2Array()
	#Increase this percentage to fill the curve
	var fill_percentage = 0.5
	
	# Add points from first curve
	var baked_points1 = curve1.get_baked_points()
	var num_points1 = int(baked_points1.size() * fill_percentage)
	for i in num_points1:
		fill_bottom_curve.append(baked_points1[i])


	# Add points from second curve in REVERSE order
	var baked_points2 = curve2.get_baked_points()
	var num_points2 = int(baked_points2.size() * fill_percentage)
	for i in range(num_points2 -1, -1, -1):
		fill_bottom_curve.append(baked_points2[i])

	fill_polygon.polygon = fill_bottom_curve
	fill_polygon.color = Color.WHITE
	add_child(fill_polygon)
	
	
	
	
	#2nd top
	var curve3 = Curve2D.new()
	curve3.add_point(Vector2(1100, 380), Vector2.ZERO, Vector2(0, -100))
	curve3.add_point(Vector2(1200, 280), Vector2(0, 0), Vector2(0, 0))
	curve3.add_point(Vector2(1300, 380), Vector2(0, -100), Vector2.ZERO)
	var line3 = Line2D.new()
	line3.points = curve3.get_baked_points()
	line3.width = 8
	add_child(line3)
	
	#1st Top
	var curve4 = Curve2D.new()
	curve4.add_point(Vector2(1000, 380), Vector2.ZERO, Vector2(0, -200))
	curve4.add_point(Vector2(1200, 180), Vector2(0, 0), Vector2(0, 0))
	curve4.add_point(Vector2(1400, 380), Vector2(0, -200), Vector2.ZERO)
	var line4 = Line2D.new()
	line4.points = curve4.get_baked_points()
	line4.width = 8
	add_child(line4)
	
