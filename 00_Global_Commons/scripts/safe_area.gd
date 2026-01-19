##USE IN OTHER MARGINCONTAINER SCRIPTS
#extends MarginContainer
#
#func _ready():
	#SafeArea.apply_to_container(self)

#extends Node ##for global
extends MarginContainer

# These variables can be accessed from ANY other script
var buffer: int = 20
var margin_left: int = 0
var margin_top: int = 0
var margin_right: int = 0
var margin_bottom: int = 0

func _ready():
	update_offsets()
	# Update if the screen rotates 180 or changes size
	get_viewport().size_changed.connect(update_offsets)

func update_offsets():
	var safe_area = DisplayServer.get_display_safe_area()
	var screen_size = get_viewport().get_visible_rect().size
	
	# We use max() to ensure we take either the safe area OR our buffer, whichever is larger (for tablets)
	margin_left = max(safe_area.position.x, buffer)
	margin_top = max(safe_area.position.y, buffer)
	margin_right = max(screen_size.x - safe_area.end.x, buffer)
	margin_bottom = max(screen_size.y - safe_area.end.y, buffer)
	
#
## Helper function to apply these margins to any MarginContainer
#func apply_to_container(container: MarginContainer):
	#container.add_theme_constant_override("margin_left", margin_left)
	#container.add_theme_constant_override("margin_top", margin_top)
	#container.add_theme_constant_override("margin_right", margin_right)
	#container.add_theme_constant_override("margin_bottom", margin_bottom)
