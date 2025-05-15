extends AnimatableBody2D

@export var speed : float = 50
@export var slow_speed : float = 10
@export var hitbox_indicator : Sprite2D
var velocity : Vector2

var sprite : JermaAnimator

signal shoot
signal request_special

func get_input() -> Vector2:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	return input_direction * (slow_speed if Input.is_action_pressed("Slow") else speed)

func _ready() -> void:
	sprite = get_child(1)

func _physics_process(delta):
	if(Input.is_action_pressed("Shoot")):
		shoot.emit()
	
	if(Input.is_action_just_pressed("Special")):
		request_special.emit()
	
	velocity = get_input()
	#print(velocity)
	if(!velocity.is_zero_approx()):
		move_and_collide(velocity)

func _process(delta: float) -> void:
	if(velocity.dot(Vector2.RIGHT) > 0) :
		sprite.flip_h = true
	elif (velocity.dot(Vector2.LEFT) > 0):
		sprite.flip_h = false


func _on_hitbox_body_entered(body: Node2D) -> void:
	if(body is Bullet) :
		die()


func die() :
	
	pass
