extends Sprite2D
var is_pressed : bool

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			is_pressed = true
		else:
			is_pressed = false

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag and is_pressed:
		position = event.position
