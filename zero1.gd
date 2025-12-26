extends Node2D

# This script creates a coloring book feature where users can click and drag
# to fill specific areas with colors or textures

class_name ColoringArea

# Reference to the area sprite/polygon
@export var area_shape: CollisionShape2D
@export var fill_texture: Texture2D
@export var fill_color: Color = Color.RED

var is_filled: bool = false
var is_drawing: bool = false
var drawn_polygon: Polygon2D

func _ready():
	# Create a polygon or sprite for the fillable area
	setup_area()

func setup_area():
	# Create a Polygon2D node for drawing
	drawn_polygon = Polygon2D.new()
	drawn_polygon.visible = false
	add_child(drawn_polygon)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Check if mouse is over this area
				if is_point_in_area(event.position):
					is_drawing = true
					start_filling()
			else:
				is_drawing = false
	
	elif event is InputEventMouseMotion and is_drawing:
		# Continue filling while dragging
		if is_point_in_area(event.position):
			continue_filling()

func is_point_in_area(point: Vector2) -> bool:
	# Check if the point is within the area's bounds
	# This depends on your area definition (CollisionShape2D, Polygon, etc.)
	if area_shape and area_shape.shape:
		var local_point = area_shape.to_local(point)
		return area_shape.shape.collide(Transform2D.IDENTITY, area_shape.shape, Transform2D(0, local_point))
	return false

func start_filling():
	if not is_filled:
		fill_area()

func continue_filling():
	# Optional: add progressive filling effect
	pass

func fill_area():
	is_filled = true
	drawn_polygon.visible = true
	
	# Set the color or texture
	if fill_texture:
		drawn_polygon.texture = fill_texture
	else:
		drawn_polygon.color = fill_color
	
	# You can also add a fill animation here
	var tween = create_tween()
	tween.tween_property(drawn_polygon, "modulate:a", 1.0, 0.3).from(0.0)
	
	
	
	
	
	
# ============================================
# MAIN COLORING BOOK CONTROLLER
# ============================================

class ColoringBook:
	extends Node2D
	
	# Areas to color (letters, shapes, etc.)
	var coloring_areas: Array[ColoringRegion] = []
	var current_color: Color = Color.RED
	var current_texture: Texture2D = null
	
	func _ready():
		setup_coloring_areas()
	
	func setup_coloring_areas():
		# Define your colorable regions (e.g., letter outlines)
		# Example: Letter "A" region
		var letter_a = ColoringRegion.new()
		letter_a.points = PackedVector2Array([
			Vector2(100, 200),
			Vector2(150, 100),
			Vector2(200, 200),
			Vector2(180, 200),
			Vector2(150, 130),
			Vector2(120, 200)
		])
		letter_a.position = Vector2(100, 100)
		add_coloring_region(letter_a)
	
	func add_coloring_region(region: ColoringRegion):
		coloring_areas.append(region)
		add_child(region)
		region.set_fill_color(current_color)
		region.set_fill_texture(current_texture)

# ============================================
# COLORING REGION CLASS
# ============================================

class ColoringRegion:
	extends Area2D
	
	var points: PackedVector2Array
	var fill_color: Color = Color.WHITE
	var fill_texture: Texture2D
	var is_filled: bool = false
	
	var outline: Line2D
	var fill_polygon: Polygon2D
	var collision_polygon: CollisionPolygon2D
	
	func _ready():
		setup_region()
		#mouse_entered.connect(_on_mouse_entered)
		#mouse_exited.connect(_on_mouse_exited)
	
	func setup_region():
		# Create outline
		outline = Line2D.new()
		outline.points = points
		outline.closed = true
		outline.width = 3
		outline.default_color = Color.BLACK
		add_child(outline)
		
		# Create fill polygon (initially transparent)
		fill_polygon = Polygon2D.new()
		fill_polygon.polygon = points
		fill_polygon.color = Color(fill_color.r, fill_color.g, fill_color.b, 0)
		add_child(fill_polygon)
		
		# Create collision shape for mouse detection
		collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = points
		add_child(collision_polygon)
	
	func set_fill_color(color: Color):
		fill_color = color
		if fill_polygon:
			fill_polygon.color = color
	
	func set_fill_texture(texture: Texture2D):
		fill_texture = texture
		if fill_polygon and texture:
			fill_polygon.texture = texture
	
	func _input(event):
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				var mouse_pos = get_global_mouse_position()
				if _is_point_inside(mouse_pos):
					fill()
	
	func _is_point_inside(point: Vector2) -> bool:
		return Geometry2D.is_point_in_polygon(to_local(point), points)
	
	func fill():
		if is_filled:
			return
		
		is_filled = true
		
		# Animate the fill
		var tween = create_tween()
		if fill_texture:
			tween.tween_property(fill_polygon, "modulate:a", 1.0, 0.3)
		else:
			tween.tween_property(fill_polygon, "color", fill_color, 0.3)
		
		# Optional: Play sound effect
		# $FillSound.play()

# ============================================
# USAGE EXAMPLE IN YOUR MAIN SCENE
# ============================================
