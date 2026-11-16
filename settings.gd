extends Control


func _ready() -> void:
	$VBoxContainer/Lifeslider.value = PlayerStats.max_lives
	$VBoxContainer/Bombslider.value = PlayerStats.max_bombs



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Title.tscn")
	pass # Replace with function body.


func _on_bombslider_value_changed(value: float) -> void:
	PlayerStats.max_bombs = roundi(value)
	pass # Replace with function body.


func _on_lifeslider_value_changed(value: float) -> void:
	PlayerStats.max_lives = roundi(value)
	pass # Replace with function body.
