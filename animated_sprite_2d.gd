extends AnimatedSprite2D
class_name JermaAnimator

var dead : bool = false
var special : bool = false

signal finish_dead
signal finish_special

func _process(delta: float) -> void:
	if(dead or special):
		return
	if (shooting()) :
		animation = "shoot"
	elif (moving()) :
		animation = "run"
	else :
		animation = "idle"


func moving() -> bool:
	return (Input.is_action_pressed("ui_up") 
		or Input.is_action_pressed("ui_down") 
		or Input.is_action_pressed("ui_left") 
		or Input.is_action_pressed("ui_right"))

func shooting() -> bool:
	return Input.is_action_pressed("Shoot")


func _on_trigger_dead():
	dead = true
	animation = "dead"


func _on_animation_finished() -> void:
	if animation == "dead":
		dead = false
		finish_dead.emit()
	elif animation == "special":
		special = false
		finish_special.emit()


func _on_bomb_emitter_trigger_special() -> void:
	print("checking dead")
	if(!dead and !special):
		print("specialing")
		special = true
		play("special")
