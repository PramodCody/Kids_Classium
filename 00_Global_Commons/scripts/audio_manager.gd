extends Node

@onready var Button_Sound = $Button_Sound
@onready var Click_Sound = $Click_Sound

func play_button_sound():
	Button_Sound.playing = true
func play_click_sound(toggle_on: bool): #toggled on is important
	Click_Sound.playing = true

func on_button_down(node):
	#Button_Sound.playing = true
	ButtonAnimation.button_down_animation(node)
func on_button_up(node):
	Button_Sound.playing = true
	ButtonAnimation.button_up_animation(node)

func _enter_tree() -> void:
	get_tree().node_added.connect(on_new_node)

func on_new_node(node):
	if node.is_in_group("button_sound"):
		node.button_down.connect(on_button_down.bind(node))
		node.button_up.connect(on_button_up.bind(node))
	if node.is_in_group("click_sound"):
		node.toggled.connect(play_click_sound)
