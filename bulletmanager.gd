extends Node2D
class_name BulletManager

var bullets : Array

func _on_add_bullet(bullet : Bullet, position : Vector2) -> void:
	add_child(bullet)
	bullet.global_position = position
	bullets.append(bullet)
	bullet.id = bullets.size()-1
	pass # Replace with function body.


func _on_modify_bullet(bullet: Bullet, property : String, value : Variant):
	pass

func _on_destroy_bullet(bullet: Bullet):
	bullets.remove_at(bullet.id)
	bullet.queue_free()
