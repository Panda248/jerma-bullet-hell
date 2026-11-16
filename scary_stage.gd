extends Node2D

@export var bullet : PackedScene
@export var num_bullets : int = 10
@export var delta_deg : int = 10

var ray : RayCast2D
var pos : Node2D
var anim : AnimationPlayer
signal add_bullet(bullet : Variant, position : Vector2)

func _ready() -> void:
	ray = $Node2D/RayCast2D
	pos = $Node2D
	anim = $AnimationPlayer


func _on_timer_timeout() -> void:
	var deg = num_bullets * -delta_deg / 2
	for i in num_bullets:
		var bulletInst : Bullet = bullet.instantiate()
		var direc = ray.target_position.rotated(deg_to_rad(deg) + pos.rotation)
		bulletInst.direction = direc.normalized()
		add_bullet.emit(bulletInst, pos.global_position + direc)
		deg += delta_deg
