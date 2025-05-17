extends Node2D

@export var bullet : PackedScene
var timer : Timer
var can_shoot : bool = true;
var player : Node2D

signal add_bullet(bullet : Variant, position : Vector2)


func _ready() -> void:
	player = get_parent().get_parent().find_child("Player")

func _on_timer_timeout() -> void:
	var bulletInstance : HomingBullet = bullet.instantiate()
	bulletInstance.player = player
	bulletInstance.direction = Vector2.RIGHT
	emit_signal("add_bullet", bulletInstance, global_position)
	bulletInstance = bullet.instantiate()
	bulletInstance.player = player
	bulletInstance.direction = Vector2.LEFT
	emit_signal("add_bullet", bulletInstance, global_position)


func _on_atktimer_timeout() -> void:
	if($Timer.is_stopped()):
		$Timer.start()
	else:
		$Timer.stop()
	pass # Replace with function body.
