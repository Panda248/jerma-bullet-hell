extends VideoStreamPlayer

@export var videos : Array[VideoStream]
@export var button : Button

var index : int = 0

func _ready() -> void:
	paused = true


func _on_finished() -> void:
	index = randi() % videos.size();
	stream = videos[index];
	play();


func _on_now_playing_toggled(toggled_on: bool) -> void:
	if(toggled_on):
		paused = true
		button.text = "Play Cable Television"
	else:
		paused = false
		button.text = "Pause Cable Television"
