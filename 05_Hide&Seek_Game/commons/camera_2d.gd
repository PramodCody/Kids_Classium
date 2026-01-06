extends Camera2D

var drag_speed = 1.0
@onready var background_image = $"../TextureRect"

func movement_limit():
	limit_left = background_image.position.x
	limit_right = background_image.size.x
	

func _ready() -> void:
	movement_limit()

func _unhandled_input(event):
	if event is InputEventScreenDrag:
		position.x -= event.relative.x * drag_speed
		position.x = clamp(position.x, 1200, background_image.size.x - 1200) #always pressing thus the 1 disappears without manual press
