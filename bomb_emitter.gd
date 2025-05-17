extends Node2D
class_name BombEmitter

var can_bomb : bool = true

var timer : Timer

var clearArea : Area2D
var animation : AnimationPlayer

signal trigger_special

func _ready() -> void:
	animation = $AnimationPlayer
	clearArea = $Area2D
	timer = $Cooldown

func _on_timer_timeout() -> void:
	can_bomb = true
	pass # Replace with function body.


func _on_player_request_special() -> void:
	print("requesting bomb")
	if(can_bomb and PlayerStats.bombs > 0):
		print("triggering bomb")
		can_bomb = false
		timer.start()
		trigger_special.emit()
		animation.play("trigger")
		clearArea.monitoring = true
		PlayerStats.bombs-=1
		print(PlayerStats.bombs)
		pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	clearArea.monitoring = false
	animation.play("RESET")
	pass # Replace with function body.
