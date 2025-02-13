extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/game_modes.tscn") # Replace with function body.

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit(0)
