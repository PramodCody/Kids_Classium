extends CanvasLayer

@onready var animation_player = $AnimationPlayer

func change_scene(target_scene_path: String):
	# 1. Play the 'fade in' (to black)
	animation_player.play("Fade")
	
	# Wait until the animation reaches the middle (the black screen)
	# We use a timer or a specific marker. Here we wait for 0.5s.
	await get_tree().create_timer(0.5).timeout
	
	# 2. Change the actual scene
	get_tree().change_scene_to_file(target_scene_path)
	
	# The animation continues playing 'fade out' (to transparent) automatically
