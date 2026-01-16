extends TextureButton
@export var Target_Scene : String


var scale_strength = 0.1
var animation_speed = 0.1

func _ready():
	visible = false
	modulate.a = 0.0

func show_with_fade():
	visible = true
	modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 2.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _on_button_down() -> void:
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	


func _on_button_up() -> void:
	
	pivot_offset = size/2
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	
	
	if Target_Scene != "":
		get_tree().change_scene_to_file(Target_Scene)
