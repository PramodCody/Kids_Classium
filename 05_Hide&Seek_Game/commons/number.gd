extends Label
signal found_number


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			$Area2D/Timer.start()
		else:
			$Area2D/Timer.stop()
		
	if event is InputEventScreenDrag:
		$Area2D/Timer.stop()

func _on_timer_timeout() -> void:
	found_number.emit()
	queue_free()
