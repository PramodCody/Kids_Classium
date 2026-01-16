extends Control

@onready var Retry_Node = %Retry_Button
@export var Retry_Scene : String
@onready var Next_Node = %Next_Button
@export var Next_Scene : String


var scale_strength = 0.1
var animation_speed = 0.1

func show_with_fade(button : String):
	var Current_Button
	if button == "retry":
		Current_Button = Retry_Node
		Retry_Node.visible = true
		Retry_Node.modulate.a = 0.0
	if button == "next":
		Current_Button = Next_Node
		Next_Node.visible = true
		Next_Node.modulate.a = 0.0
	
	var tween = create_tween()
	tween.tween_property(Current_Button, "modulate:a", 1.0, 2.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func down_Bubbly_Doubly(button: String):
	
	var Current_Button
	if button == "retry":
		Current_Button = Retry_Node
		Retry_Node.pivot_offset = Retry_Node.size/2
	if button == "next":
		Current_Button = Next_Node
		Next_Node.pivot_offset = Next_Node.size/2
	
	var tween = create_tween()
	tween.tween_property(Current_Button, "scale", Vector2.ONE * (1.0 - scale_strength), animation_speed)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
func up_Bubbly_Doubly(button: String):
	var Current_Button
	if button == "retry":
		Current_Button = Retry_Node
		Retry_Node.pivot_offset = Retry_Node.size/2
	if button == "next":
		Current_Button = Next_Node
		Next_Node.pivot_offset = Next_Node.size/2
	
	var tween = create_tween()
	tween.tween_property(Current_Button, "scale", Vector2.ONE, animation_speed * 4)\
	.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)



func _on_retry_button_button_down() -> void:
	down_Bubbly_Doubly("retry")

func _on_retry_button_button_up() -> void:
	up_Bubbly_Doubly("retry")
	if Retry_Scene != "":
		get_tree().change_scene_to_file(Retry_Scene)



func _on_next_button_button_down() -> void:
	down_Bubbly_Doubly("next")

func _on_next_button_button_up() -> void:
	up_Bubbly_Doubly("next")
	if Next_Scene != "":
		get_tree().change_scene_to_file(Next_Scene)
