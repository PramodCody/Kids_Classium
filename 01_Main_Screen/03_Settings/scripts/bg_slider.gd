extends HSlider

@export var audio_bus_name: String
@onready var _bus := AudioServer.get_bus_index(audio_bus_name)

func _ready():
	# Set the slider to match the current volume when the game starts
	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))
	value_changed.connect(_on_value_changed)

func _on_value_changed(new_value: float):
	# Convert the 0.0-1.0 slider value to Decibels for the audio engine
	AudioServer.set_bus_volume_db(_bus, linear_to_db(new_value))
