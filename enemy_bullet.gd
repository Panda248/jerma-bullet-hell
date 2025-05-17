extends Bullet
class_name HomingBullet

var player : Node2D

func _on_homing_timer_timeout() -> void:
	#print("homing0s")
	if(player != null):
		#print("homing")
		speed = max_speed
		damping = 0.98
		direction = global_position.direction_to(player.global_position)
