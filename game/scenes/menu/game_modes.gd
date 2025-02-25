extends Control


func _on_crazy_tiles_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/crazy_tiles.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")


func _on_single_player_pressed() -> void:
	get_tree().change_scene_to_file("res://game/scenes/world/world.tscn") # Replace with function body.
