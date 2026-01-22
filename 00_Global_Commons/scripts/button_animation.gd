extends Node
var scale_strength = 0.1
var animation_speed = 0.1

func button_down_animation(target_button):
	AudioManager.Button_Sound.playing = true
	target_button.pivot_offset = target_button.size/2
	var tween = create_tween()
	tween.tween_property(target_button, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await AudioManager.Button_Sound.finished

func button_up_animation(target_button):
	AudioManager.Button_Sound.playing = true
	target_button.pivot_offset = target_button.size/2
	var tween = create_tween()
	tween.tween_property(target_button, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	await AudioManager.Button_Sound.finished
