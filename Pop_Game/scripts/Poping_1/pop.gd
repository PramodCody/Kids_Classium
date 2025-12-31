extends Sprite2D
var random_position = Vector2(randf_range(200, 2000), 1200)


func _ready() -> void:
	position = random_position

func appear():
	pass

func move_up():
	position.y -= 5
	if position.y <= 0:
		queue_free() #gone from memory


func _process(delta: float) -> void:
	move_up()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		queue_free()
