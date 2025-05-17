extends Bullet
class_name Laser

func _ready() -> void:
	$AnimationPlayer.play("enter")
	rotate(direction.angle())
	speed = max_speed

func _physics_process(delta: float) -> void:
	rotate(deg_to_rad(speed))


func _on_lifespan_timeout() -> void:
	$CollisionShape2D.disabled = true
	if(!$AnimationPlayer.is_playing()):
		_request_destroy()
	pass # Replace with function body.
