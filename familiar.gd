extends HomingBullet
class_name Familiar

var bulletScene: PackedScene

func _ready() -> void:
	bulletScene = preload("res://enemy_bullet.tscn")

func _on_shooting_timer_timeout() -> void:
	if manager != null:
		var bullet : HomingBullet = bulletScene.instantiate()
		bullet.direction = Vector2.UP.rotated(PI/4.0)
		bullet.max_speed = 10
		bullet.player = player
		manager._on_add_bullet(bullet, global_position)
		
		bullet = bulletScene.instantiate()
		bullet.direction = Vector2.DOWN.rotated(PI/4.0)
		bullet.max_speed = 10
		bullet.player = player
		manager._on_add_bullet(bullet, global_position)
		
		bullet = bulletScene.instantiate()
		bullet.direction = Vector2.LEFT.rotated(PI/4.0)
		bullet.max_speed = 10
		bullet.player = player
		manager._on_add_bullet(bullet, global_position)
		
		bullet = bulletScene.instantiate()
		bullet.direction = Vector2.RIGHT.rotated(PI/4.0)
		bullet.max_speed = 10
		bullet.player = player
		manager._on_add_bullet(bullet, global_position)
