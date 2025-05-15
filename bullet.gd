extends StaticBody2D
class_name Bullet

var id : int = -1
var direction : Vector2 = Vector2.UP
@export var damage : int = 1
@export var speed : int = 25

func _physics_process(delta: float) -> void:
	move_and_collide(direction * speed);


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
