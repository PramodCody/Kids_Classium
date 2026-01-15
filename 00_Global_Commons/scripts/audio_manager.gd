extends Node

@onready var Button_Sound_Scene = $Texture_Button_Sound
var Texture_Button_Sound = preload("res://00_Global_Commons/assests/Button_Sound.mp3")

func Play_Button_Sound(clip):
	Button_Sound_Scene.stream = clip
	Button_Sound_Scene.play()

func _on_any_texture_button_pressed():
	Play_Button_Sound(Texture_Button_Sound)


func _ready():
	for node in get_tree().get_nodes_in_group("texture_buttons"):
		
		if not node.button_down.is_connected(on_button_down.bind(node)):
			node.button_down.connect(on_button_down.bind(node))
	# Connect to button_up (when released)
		if not node.button_up.is_connected(on_button_up.bind(node)):
			node.button_up.connect(on_button_up.bind(node))

func on_button_down(node):
	Play_Button_Sound(Texture_Button_Sound)

func on_button_up(node):
	Play_Button_Sound(Texture_Button_Sound)
