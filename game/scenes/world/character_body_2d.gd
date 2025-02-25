extends CharacterBody2D

@onready var tile_map = $"../tile-platform"

func _process(delta: float) -> void:
	if Input.is_action_just_released("up"):
		print("U")
		move(Vector2.UP)
	elif Input.is_action_just_released("down"):
		print("D")
		move(Vector2.DOWN)
	elif Input.is_action_just_released("left"):
		print("L")
		move(Vector2.LEFT)
	elif Input.is_action_just_released("right"):
		print("R")
		move(Vector2.RIGHT)
# Called when an input event occurs whilst mouse touches collision box
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_released("clicked"):
		# Show Possible paths
		print("Character clicked")
	pass # Replace with function body.

func move(direction: Vector2i):
	# Current tile coordinates
	print("GlobalCurrentPosition:",global_position)
	var current_coords : Vector2i = tile_map.local_to_map(global_position)
	print("LocalCurrentPosition:",current_coords)
	
	# Target tile coordinates
	var target_coords : Vector2i = Vector2i(
		current_coords.x + direction.x,
		current_coords.y + direction.y
	)
	print("LocalTargetPosition:",target_coords)
	
	var global_target_coords : Vector2i = tile_map.map_to_local(target_coords)
	
	print("GlobalTargetPosition:",global_target_coords)
	
	print("GTP1:",to_local(global_target_coords))
	print("GTP2:",tile_map.local_to_map(to_local(global_target_coords)))
	
	## Get custom data layer from tilemap (Checks if tile is walkable)
	var cell_data : TileData = tile_map.get_cell_tile_data(target_coords)
	
	if cell_data == null:
		print("Cell doesnt exists")
		return
	
	if cell_data.get_custom_data("walkable") == false:
		print("You cant walk right there")
		return
		
	# Move player
	
	global_position = tile_map.map_to_local(target_coords)
	print(global_position)
	
	return
