extends Control
@onready var progressbar = $ProgressBar

var bubble_template = preload("res://Pop_Game/commons/bubble_pop.tscn")
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


func on_bubble_poped():
	progressbar.value += 1
	if progressbar.value >= 10:
		$Retry_Button.show_with_fade()
		$Next_Button.show_with_fade()
		isWin = true
		
	await get_tree().create_timer(1).timeout
	spawn_bubble() #whichever pops appears again

func on_automatic_poped():
	await get_tree().create_timer(1).timeout
	spawn_bubble()
