extends Node2D
class_name BombEmitter

var can_bomb : bool = true

var timer : Timer

signal trigger_special

func _ready() -> void:
	timer = get_child(0)

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
		PlayerStats.bombs-=1
		print(PlayerStats.bombs)
		pass # Replace with function body.
