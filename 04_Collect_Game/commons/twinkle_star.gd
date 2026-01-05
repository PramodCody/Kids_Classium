extends Sprite2D
signal star_status
signal target_star_status


func _ready() -> void:
	$Number.text = str(randi_range(0, 2))

func _process(delta: float) -> void:
	position.x -= 7
	if position.x < 0:
		star_status.emit()
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if $Number.text == "1":
			target_star_status.emit()
			queue_free()
