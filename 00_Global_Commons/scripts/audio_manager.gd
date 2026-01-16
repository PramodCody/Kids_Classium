extends Node

@onready var Button_Sound = $Button_Sound
@onready var Click_Sound = $Click_Sound

func play_button_sound():
	Button_Sound.playing = true
func play_click_sound(toggle_on: bool): #toggled on is important
	Click_Sound.playing = true

func _enter_tree() -> void:
	get_tree().node_added.connect(on_new_node)

func on_new_node(node):
	if node.is_in_group("button_sound"):
		node.button_down.connect(play_button_sound)
		node.button_up.connect(play_button_sound)
	if node.is_in_group("click_sound"):
		node.toggled.connect(play_click_sound)
