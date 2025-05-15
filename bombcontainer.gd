extends HBoxContainer

var bomb_icon : TextureRect
var bombs = 0


func _ready() -> void:
	bomb_icon = get_child(0)
	bombs = PlayerStats.bombs
	for n in bombs - 1:
		add_child(bomb_icon.duplicate())

func _physics_process(delta: float) -> void:
	if(bombs != PlayerStats.bombs):
		get_child(bombs - 1).hide()
		bombs = PlayerStats.bombs
