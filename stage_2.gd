extends Node2D
@export var bullet : PackedScene
var timer : Timer
var can_shoot : bool = true;
var player : Node2D

signal add_bullet(bullet : Variant, position : Vector2)

func _ready() -> void:
	player = get_parent().get_parent().find_child("Player")

func _on_timer_timeout() -> void:
	var bulletInstance : Familiar = bullet.instantiate()
	bulletInstance.player = player
	bulletInstance.direction = Vector2.RIGHT.rotated(PI/6.0)
	emit_signal("add_bullet", bulletInstance, global_position)
	bulletInstance = bullet.instantiate()
	bulletInstance.player = player
	bulletInstance.direction = Vector2.LEFT.rotated(-PI/6.0)
	emit_signal("add_bullet", bulletInstance, global_position)
	pass # Replace with function body.
