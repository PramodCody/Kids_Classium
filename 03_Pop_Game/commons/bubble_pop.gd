extends Node2D
@onready var Bubble = $Bubble
@onready var label = $Bubble/Label
@onready var pop_effect = $Pop_Effect
@onready var pop_sound = $Pop_Sound
@onready var non_pop_sound = $Non_Pop_Sound
signal poped

var random_position = Vector2(randf_range(200, 2000), 1200)
var random_x_movement = randf_range(-1.5, 1.5)
var random_percentage = randi_range(0,100)

func MoveUp():
	position.y -= 3
	if position.y <= 0:
		queue_free()
	
	position.x += random_x_movement
	if position.x <= 0 or position.x >= 2400:
		queue_free()

func _ready() -> void:
	var random_number = randi_range(0, 2)
	position = random_position
	while random_number == 1:
		random_number = randi_range(0, 2)
	label.text = str(random_number)
	
func _process(delta: float) -> void:
	MoveUp()

func non_pop_animation():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.9, 0.9), 0.1)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.1)
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)

	

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		if label.text == "1":
			poped.emit()
			pop_effect.emitting = true
			pop_sound.playing = true
			Bubble.visible = false
			await get_tree().create_timer(pop_effect.lifetime).timeout
			queue_free()
		else :
			non_pop_animation()
			non_pop_sound.playing = true
