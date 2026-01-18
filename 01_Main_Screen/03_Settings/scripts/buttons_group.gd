extends VBoxContainer

func _on_about_toggled(toggled_on: bool) -> void:
	%Sound_Dialog.visible = false
	%About_Dialog.visible = true

func _on_sound_toggled(toggled_on: bool) -> void:
	%About_Dialog.visible = false
	%Sound_Dialog.visible = true
