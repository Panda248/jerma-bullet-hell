extends AnimatableBody2D
class_name Bullet

var id : int = -1
@export var direction : Vector2 = Vector2.UP
@export var damage : int = 1
@export var max_speed : int = 20
@export var min_speed : int = 5
@export var damping : float = 0.95
var speed = max_speed;

@onready var animation : AnimationPlayer = $AnimationPlayer

var manager : BulletManager



func _physics_process(delta: float) -> void:
	speed = max(speed * damping, min_speed)
	move_and_collide(direction * speed);

func _request_destroy():
	direction = Vector2.ZERO
	speed = 0
	min_speed = 0
	animation.play("destroy")

func destroy():
	if manager != null:
		manager.bullets.erase(self)
	else:
		print("null element in manager with id " + str(id))
	queue_free()
	


func _on_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "destroy"):
		destroy()


func _on_bounds_checker_body_entered(body: Node2D) -> void:
	destroy()
