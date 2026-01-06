extends Control


var grass_template = preload("res://05_Hide&Seek_Game/commons/grass.tscn")
var cloud_template = preload("res://05_Hide&Seek_Game/commons/cloud.tscn")
var number_1_template = preload("res://05_Hide&Seek_Game/commons/number.tscn")
var spawn_positions : Array[Vector2]

func spawn_grass():
	var new_grass = grass_template.instantiate()
	add_child(new_grass)
	var grass_random_position = Vector2(randf_range(200, 2200), randf_range(700, 1000))
	new_grass.position = grass_random_position
	spawn_positions.append(new_grass.position)


func spawn_cloud():
	var new_cloud = cloud_template.instantiate()
	add_child(new_cloud)
	var cloud_random_position = Vector2(randf_range(400, 2200), randf_range(50, 300))
	new_cloud.position = cloud_random_position
	spawn_positions.append(new_cloud.position)


func spawn_number():
	var new_number = number_1_template.instantiate()
	add_child(new_number)
	var random_index = randi_range(0, 9)
	new_number.position = spawn_positions[random_index] - new_number.size/2
	new_number.found_number.connect(on_finding_number)

func on_finding_number():
	$ProgressBar.value += 1
	if $ProgressBar.value == 3:
		$Level_Control/Retry_Button.show_with_fade()
		$Level_Control/Next_Button.show_with_fade()

func _ready() -> void:
	for i in 5:
		spawn_grass()
	for i in 5:
		spawn_cloud()
	for i in 3:
		spawn_number()
