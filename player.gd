extends CharacterBody2D

@export var speed : float = 50
@export var slow_speed : float = 10
@export var hitbox_indicator : Sprite2D
#var velocity : Vector2

var sprite : JermaAnimator
var hitbox : Area2D

var controllable : bool = true

var invincible : bool = false

signal shoot
signal request_special
signal trigger_dead
signal respawn

func get_input() -> Vector2:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	return input_direction * (slow_speed if Input.is_action_pressed("Slow") else speed)

func _ready() -> void:
	sprite = get_child(1)
	hitbox = $hitbox

func _physics_process(delta):
	if(controllable):
		if(Input.is_action_pressed("Shoot") ):
			shoot.emit()
		
		if(Input.is_action_just_pressed("Special")):
			request_special.emit()
		
		velocity = get_input()
		
		if(!velocity.is_zero_approx()):
			move_and_slide()

func _process(delta: float) -> void:
	if(velocity.dot(Vector2.RIGHT) > 0) :
		sprite.flip_h = true
	elif (velocity.dot(Vector2.LEFT) > 0):
		sprite.flip_h = false

func _on_hitbox_body_entered(body: Node2D) -> void:
	if(body is Bullet and controllable == true) :
		body._request_destroy()
		if !invincible:
			controllable = false
			trigger_dead.emit()
		

func _on_finish_dead() -> void:
	PlayerStats.lives -= 1
	if(PlayerStats.lives == 0) :
		get_tree().change_scene_to_file("res://Lose.tscn")
	#global_position = get_parent().find_child("RespawnPoint").global_position
	sprite.play("spawn")
	hitbox.monitoring = false

func _on_finish_spawn() -> void:
	controllable = true
	hitbox.monitoring = true
	invincible = true
	$Invincibility.start()
	sprite.self_modulate = Color(3,3,3)
	respawn.emit()


func _on_invincibility_timeout() -> void:
	sprite.self_modulate = Color.WHITE
	invincible = false
	pass # Replace with function body.
