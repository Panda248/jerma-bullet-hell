extends HBoxContainer

var live_icon : TextureRect
var lives = 0


func _ready() -> void:
	live_icon = get_child(0)
	lives = PlayerStats.lives
	for n in lives - 1:
		add_child(live_icon.duplicate())

func _physics_process(delta: float) -> void:
	if(lives != PlayerStats.lives):
		get_child(lives - 1).hide()
		lives = PlayerStats.lives
