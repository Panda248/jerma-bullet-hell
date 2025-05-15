extends VideoStreamPlayer

@export var videos : Array[VideoStream]

var index : int = 0

#func _ready() -> void:
	#stream = videos[index];
	#play()


func _on_finished() -> void:
	index = randi() % videos.size();
	stream = videos[index];
	play();


func _on_now_playing_toggled(toggled_on: bool) -> void:
	if(toggled_on):
		paused = true
	else:
		paused = false
