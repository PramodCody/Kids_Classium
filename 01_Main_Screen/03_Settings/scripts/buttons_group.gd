extends VBoxContainer


func _on_about_pressed() -> void:
	$"../Action_Box/check".visible = false
	%About_Dialog.visible = true


func _on_sound_pressed() -> void:
	%About_Dialog.visible = false
	$"../Action_Box/check".visible = true
