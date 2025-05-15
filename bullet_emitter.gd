extends Node2D

@export var bullet : PackedScene
var timer : Timer
var can_shoot : bool = true;

signal add_bullet(bullet : Variant, position : Vector2)

func _ready() -> void:
	timer = get_child(0);

func _on_player_shoot() -> void:
	if(can_shoot) :
		var new_bullet : Node2D = bullet.instantiate()
		emit_signal("add_bullet", new_bullet, global_position)
		can_shoot = false
		timer.start()

func _on_timer_timeout() -> void:
	can_shoot = true;
	pass # Replace with function body.
