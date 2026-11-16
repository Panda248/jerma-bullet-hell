extends Control


func _on_button_pressed() -> void:
	PlayerStats.reset()
	get_tree().change_scene_to_file("res://Loop.tscn")
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")
	pass # Replace with function body.
