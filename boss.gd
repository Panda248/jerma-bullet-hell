extends AnimatableBody2D
class_name Enemy

@export var max_health : int = 100
var health : int

signal destroy_bullet

func _ready() -> void:
	health = max_health


func _on_hitbox_body_entered(body: Node2D) -> void:
	print("helooozzzzzzzzzzzzzzzzzzzzzzzzzzz")
	if body is Bullet:
		print("helooooo")
		take_damage(body.damage)
		body.queue_free()

func take_damage(damage : int):
	health -= damage
	if(health <= 0):
		die()

func die():
	get_tree().change_scene_to_file("res://Win.tscn")
