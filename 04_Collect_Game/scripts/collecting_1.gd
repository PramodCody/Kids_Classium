extends Control

var random_position_1 = Vector2(randf_range(1000, 1300), randf_range(100, 980))
var random_position_2 = Vector2(randf_range(1600, 1900), randf_range(100, 980))
var random_position_3 = Vector2(randf_range(2400, 2700), randf_range(100, 980))

@onready var progress_bar = $CharacterBody2D/ProgressBar
var star_template = preload("res://04_Collect_Game/commons/twinkle_star.tscn")

func spawn_star(pos : Vector2):
	var new_star = star_template.instantiate()
	add_child(new_star)
	new_star.star_status.connect(on_star_out_of_reach)
	new_star.target_star_status.connect(on_spaceship_collision_with_target_star)
	new_star.position = pos

func on_star_out_of_reach():
	if progress_bar.value >= 10:
		return
	spawn_star(Vector2(randf_range(2400, 3500), randf_range(200, 880)))


func on_spaceship_collision_with_target_star():
	progress_bar.value += 1
	if progress_bar.value == 10:
		$Level_Control/Retry_Button.show_with_fade()
		$Level_Control/Next_Button.show_with_fade()
		return
	spawn_star(Vector2(randf_range(2400, 3500), randf_range(200, 880)))


func _ready() -> void:
	spawn_star(random_position_1)
	spawn_star(random_position_2)
	spawn_star(random_position_3)

func spaceship_up():
	var tween = create_tween()
	tween.tween_property($CharacterBody2D, "position:y", $CharacterBody2D.position.y - 60, 0.1)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)

func spaceship_down():
	var tween = create_tween()
	tween.tween_property($CharacterBody2D, "position:y", $CharacterBody2D.position.y + 60, 0.1)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		if event.relative.y < -5: #UP   #-ve -10 for a little mistake forgiveness
			spaceship_up()
		if event.relative.y > 5: #DOWN   #+ve
			spaceship_down()
