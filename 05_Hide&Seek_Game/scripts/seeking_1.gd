extends Control

@onready var progress_bar = $CanvasLayer/Level_Control/ProgressBar
@onready var retry_button = $CanvasLayer/Level_Control/Retry_Button
@onready var next_button = $CanvasLayer/Level_Control/Next_Button
@onready var bacground_image = $TextureRect

var grass_template = preload("res://05_Hide&Seek_Game/commons/grass.tscn")
var cloud_template = preload("res://05_Hide&Seek_Game/commons/cloud.tscn")
var number_1_template = preload("res://05_Hide&Seek_Game/commons/number.tscn")
var spawn_positions : Array[Vector2]

func spawn_grass():
	var new_grass = grass_template.instantiate()
	add_child(new_grass)
	var grass_random_position = Vector2(randf_range(100, bacground_image.size.x-200), randf_range(850, 1000))
	new_grass.position = grass_random_position
	spawn_positions.append(new_grass.position)


func spawn_cloud():
	var new_cloud = cloud_template.instantiate()
	add_child(new_cloud)
	var cloud_random_position = Vector2(randf_range(400, bacground_image.size.x-200), randf_range(50, 400))
	new_cloud.position = cloud_random_position
	spawn_positions.append(new_cloud.position)


func spawn_number():
	var new_number = number_1_template.instantiate()
	add_child(new_number)
	var random_index = randi_range(0, 19)
	new_number.position = spawn_positions[random_index] - new_number.size/2
	new_number.found_number.connect(on_finding_number)

func on_finding_number():
	progress_bar.value += 1
	if progress_bar.value == progress_bar.max_value:
		retry_button.show_with_fade()
		next_button.show_with_fade()

func _ready() -> void:
	for i in 10:
		spawn_grass()
	for i in 10:
		spawn_cloud()
	for i in 5:
		spawn_number()
