extends Control
@onready var progressbar = $ProgressBar
@onready var Level_Control = $Level_Control
@onready var Progress_Bar_Logo = $ProgressBarLogo

var bubble_template = preload("res://03_Pop_Game/commons/bubble_pop.tscn")
var isWin = false

func _ready() -> void:
	var n = 6 #numbers of ball at once
	for i in n:
		spawn_bubble()
		await get_tree().create_timer(1).timeout
	

func spawn_bubble():
	if !isWin:
		var new_bubble = bubble_template.instantiate()
		add_child(new_bubble)
		new_bubble.poped.connect(on_bubble_poped)
		new_bubble.automatic_poped.connect(on_automatic_poped)

func on_lessons_route():
	var num = GlobalVariables.lesson_route_selected_number
	if num == 1:
		Level_Control.Next_Scene = "res://04_Collect_Game/scenes/collecting_1.tscn"
func You_Won():
	Level_Control.show_with_fade("retry")
	Level_Control.show_with_fade("next")
	on_lessons_route()

func on_bubble_poped():
	progressbar.value += 1
	if progressbar.value >= 10:
		You_Won()
		Progress_Bar_Logo.modulate.a = 255
		isWin = true
		
	await get_tree().create_timer(1).timeout
	spawn_bubble() #whichever pops appears again

func on_automatic_poped():
	await get_tree().create_timer(1).timeout
	spawn_bubble()
