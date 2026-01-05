extends Sprite2D
signal star_status

func star_move_back():
	position.x -= 7

func _process(delta: float) -> void:
	star_move_back()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("SpaceShip Touched Star")
		queue_free()
