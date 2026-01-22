extends TextureButton
@onready var play_button = %Play_Button


var scale_strength = 0.06
var animation_speed = 0.06

func _on_button_down() -> void:
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await AudioManager.Button_Sound.finished

func _on_button_up() -> void:
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	await AudioManager.Button_Sound.finished
	FadeAnimation.change_scene("res://02_Trace_Game/scenes/Tracing_1.tscn")
