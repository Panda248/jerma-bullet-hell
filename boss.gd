extends AnimatableBody2D
class_name Enemy

@export var max_health : int = 500
@export var stage2_threshold : int = 400
@export var stage3_threshold : int = 250
@export var stage4_threshold : int = 50
@export var damp : float = 0.05
@export var stage2moveperiod : float = 5
@export var stage3moveperiod : float = 3

var health : int

var stage1 : Node2D
var stage2 : Node2D
var stage3 : Node2D
var stage4 : Node2D
var current_attack: Node2D

var movetargets : Node2D

var target_position : Vector2

signal destroy_bullet

func _ready() -> void:
	health = max_health
	stage1 = $Stage1
	stage2 = $Stage2
	stage3 = $Stage3
	stage4 = $ScaryStage
	current_attack = stage1
	movetargets = $MoveTargets
	target_position = movetargets.get_child(0).global_position

func _physics_process(delta: float) -> void:
	if(position.distance_to(target_position) > 0.01):
		var direction = position.direction_to(target_position)
		move_and_collide( direction * position.distance_to(target_position) * damp)

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Bullet:
		take_damage(body.damage)
		destroy_bullet.emit(body)

func take_damage(damage : int):
	health -= damage
	if(health <= 0):
		die()
	#elif (health < stage4_threshold and current_attack == stage3):
		#stage4.process_mode = PROCESS_MODE_INHERIT
		#stage3.process_mode = PROCESS_MODE_DISABLED
		#current_attack = stage4
	elif (health < stage3_threshold and current_attack == stage2) :
		#print("stage3ing")
		stage3.process_mode = PROCESS_MODE_INHERIT
		stage2.process_mode = PROCESS_MODE_DISABLED
		current_attack = stage3
		$MoveTimer.wait_time = stage3moveperiod
	elif (health < stage2_threshold and current_attack == stage1) :
		#print("stage2ing")
		stage2.process_mode = PROCESS_MODE_INHERIT
		stage1.process_mode = PROCESS_MODE_DISABLED
		current_attack = stage2
		$MoveTimer.wait_time = stage2moveperiod
	

func die():
	get_tree().change_scene_to_file("res://Win.tscn")

func pause_attack():
	current_attack.process_mode = PROCESS_MODE_DISABLED

func resume_attack():
	current_attack.process_mode = PROCESS_MODE_INHERIT

func _on_player_trigger_dead() -> void:
	pause_attack()
	pass # Replace with function body.


func _on_player_respawn() -> void:
	resume_attack()
	pass # Replace with function body.


func _on_move_timer_timeout() -> void:
	target_position = movetargets.get_child(randi_range(0,movetargets.get_child_count()-1)).global_position
	pass # Replace with function body.


func _on_hitbox_area_entered(area: Area2D) -> void:
	#print("HELOOO")
	if (area is BombArea):
		#print("heloooo")
		take_damage(area.damage)
	pass # Replace with function body.
