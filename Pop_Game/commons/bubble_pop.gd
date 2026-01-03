extends Sprite2D

signal poped
signal automatic_poped

var random_position = Vector2(randf_range(200, 2000), 1200)
var random_number = randi_range(0, 3)
var random_x_movement = randf_range(-1, 1)

func MoveUp():
	position.y -= 5
	if position.y <= 0:
		automatic_poped.emit()
		queue_free()
	
	position.x += random_x_movement
	if position.x <= 0 or position.x >= 2400:
		automatic_poped.emit()
		queue_free()

func _ready() -> void:
	position = random_position
	$Label.text = str(random_number)
	
func _process(delta: float) -> void:
	MoveUp()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		if $Label.text == "1":
			poped.emit()
			queue_free()
