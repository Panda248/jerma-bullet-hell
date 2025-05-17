extends Area2D
class_name BombArea

@export var damage : int = 25

func _on_body_entered(body: Node2D) -> void:
	if (body is Bullet):
		body._request_destroy()
	pass # Replace with function body.
