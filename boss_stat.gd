extends HBoxContainer

@export var enemy : Enemy
var healthbar : ProgressBar

func _ready() -> void:
	healthbar = get_child(1)
	healthbar.max_value = enemy.max_health
	healthbar.value = enemy.health

func _process(delta: float) -> void:
	healthbar.value = enemy.health
