extends RichTextLabel

func _ready():
	# Connect the signal that detects when a link is clicked
	meta_clicked.connect(_on_meta_clicked)


func _on_meta_clicked(meta):
	# This opens the URL in the user's default browser
	OS.shell_open(str(meta))
