extends VBoxContainer

func _on_about_toggled(toggled_on: bool) -> void:
	$"../../../Action_Box/check".visible = false
	%About_Dialog.visible = true

func _on_sound_toggled(toggled_on: bool) -> void:
	%About_Dialog.visible = false
	$"../../../Action_Box/check".visible = true
