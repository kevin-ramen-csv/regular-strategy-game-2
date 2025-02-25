extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://game/scenes/menu/game_modes.tscn") # Replace with function body.

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://game/scenes/menu/main_menu/main_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit(0)
