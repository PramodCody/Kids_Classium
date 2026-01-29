extends Control
@onready var progressbar = %ProgressBar
@onready var Level_Control = $Level_Control

var bubble_template = preload("res://03_Pop_Game/commons/bubble_pop.tscn")
var isWin = false
var isProgressAnimation : bool = false

func _ready() -> void:
	Level_Control.visible = true
	spawn_bubble()

func spawn_bubble():
	
	var new_bubble = bubble_template.instantiate()
	add_child(new_bubble)
	new_bubble.poped.connect(on_bubble_poped)
		#new_bubble.automatic_poped.connect(on_automatic_poped)
func spawn_bubble_one():

	var new_bubble = bubble_template.instantiate()
	add_child(new_bubble)
	new_bubble.poped.connect(on_bubble_poped)
	new_bubble.label.text = "1"
	print("spaw_bubble_one_activated")

func on_lessons_route():
	var num = GlobalVariables.lesson_route_selected_number
	if num == 1:
		Level_Control.Next_Scene = "res://04_Collect_Game/scenes/collecting_1.tscn"
func You_Won():
	isWin = true
	Level_Control.show_with_fade("retry")
	Level_Control.show_with_fade("next")
	on_lessons_route()

func on_bubble_poped():
	isProgressAnimation = true
	ProgressBar_Sound.playing = true

@onready var ProgressBar_Sound = $MarginContainer/Control/ProgressBar_Sound
var animation_value = 0
func _process(delta: float) -> void:
	if isProgressAnimation:
		progressbar.value += 1
		animation_value += 1
		if animation_value >= progressbar.max_value/10:
			ProgressBar_Sound.stop()
			isProgressAnimation = false
			animation_value = 0
			if progressbar.value >= progressbar.max_value:
				You_Won()
				return
			return



func _on_one_spawn_timer_timeout() -> void:
	if !isWin:
		spawn_bubble_one()


func _on_bubble_spawn_timer_timeout() -> void:
	if !isWin:
		spawn_bubble()
