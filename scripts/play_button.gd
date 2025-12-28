extends TextureButton

var isElastic

func Elastic_Play_Button():
	isElastic = true
	while isElastic:
		if scale.x <= 1:
			
			for i in 21: #high-low/scale.x
				scale.x += 0.01
				scale.y -= 0.005
				await get_tree().create_timer(0.02).timeout
				
		if scale.x >= 1.2:
			
			for i in 21:
				scale.x -= 0.01
				scale.y += 0.005
				await get_tree().create_timer(0.02).timeout
				

func _ready() -> void:
	pivot_offset = size/2
	Elastic_Play_Button()

var scale_strength = 0.2
var animation_speed = 0.2

func _on_button_down() -> void:
	$"../Button_Sound".play()
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	await $"../Button_Sound".finished
	
func _on_button_up() -> void:
	$"../Button_Sound".play()
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	
	await $"../Button_Sound".finished
	get_tree().change_scene_to_file("res://Level_1.tscn")
