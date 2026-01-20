extends MarginContainer
signal bottom_panel_changed(margin_value)

func Safe_Area():
	var os_name = OS.get_name()
	if os_name == "Android":
		var screen_size = get_viewport_rect().size
		var safe_area = DisplayServer.get_display_safe_area()
		
		var margin_left = safe_area.position.x
		var margin_top = safe_area.position.y
		var margin_right = screen_size.x - safe_area.end.x
		var margin_bottom = screen_size.y - safe_area.end.y
		bottom_panel_changed.emit(margin_bottom)
		
		if screen_size.x > screen_size.y:
			add_theme_constant_override("margin_left", margin_left)
			add_theme_constant_override("margin_top", margin_top)
			add_theme_constant_override("margin_right", margin_right)
			add_theme_constant_override("margin_bottom", margin_bottom)

func _ready() -> void:
	Safe_Area()
