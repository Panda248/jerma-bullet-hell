extends Node2D

@export var bullet : PackedScene
@export var bullet2 : PackedScene

var laser = true

signal add_bullet(bullet : Variant, position : Vector2)

func _on_timer_timeout() -> void:
	if(laser):
		var bulletInstance : Laser = bullet.instantiate()
		bulletInstance.direction = Vector2.RIGHT.rotated(PI/4)
		emit_signal("add_bullet", bulletInstance, global_position)
		bulletInstance = bullet.instantiate()
		bulletInstance.direction = Vector2.UP.rotated(PI/4)
		emit_signal("add_bullet", bulletInstance, global_position)
		bulletInstance = bullet.instantiate()
		bulletInstance.direction = Vector2.LEFT.rotated(PI/4)
		emit_signal("add_bullet", bulletInstance, global_position)
		bulletInstance = bullet.instantiate()
		bulletInstance.direction = Vector2.DOWN.rotated(PI/4)
		emit_signal("add_bullet", bulletInstance, global_position)
	else:
		for i in 25:
			var bulletInstance : HomingBullet = bullet2.instantiate()
			bulletInstance.direction = Vector2.from_angle(i * PI/12.0)
			emit_signal("add_bullet", bulletInstance, global_position)


func _on_atkswitch_timeout() -> void:
	laser = !laser
