extends Sprite2D

func _process(delta: float) -> void:
	if(Input.is_action_pressed("Slow")):
		show()
	else :
		hide()
