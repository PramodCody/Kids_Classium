extends TextureButton


var scale_strength = 0.2
var animation_speed = 0.2


func _on_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	get_tree().change_scene_to_file("res://02_Trace_Game/scenes/Tracing_1.tscn")
 # Replace with function body.
