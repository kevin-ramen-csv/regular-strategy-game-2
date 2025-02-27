class_name BaseEntity extends CharacterBody2D

#Properties
var tile_map : TileMapLayer


#Methods
func move(direction: Vector2i):
	if !_has_floor():
		print("No platform assigned to the player!")
		return false
	# Character current coordinates in the tilemap
	var current_coords : Vector2i = self.tile_map.local_to_map(global_position)
	
	# Target cell coordinates
	var target_coords : Vector2i = Vector2i(
		current_coords.x + direction.x,
		current_coords.y + direction.y
	)
	#Checks if the target cell is walkable
	if !is_walkable(target_coords):
		print("Can't walk on air!")
		return false
		
	# Move player
	global_position = tile_map.map_to_local(target_coords)
	
	
func is_walkable(target_coords : Vector2i) -> bool:
	if !_has_floor():
		print("No platform assigned to the player!")
		return false
		
	## Checks if cell is walkable
	var cell_data : TileData = self.tile_map.get_cell_tile_data(target_coords)
	
	if cell_data == null:
		print("Cell doesnt exists")
		return false
		
	return cell_data.get_custom_data("walkable")

func valid_moves():
	var current_coords : Vector2i = self.tile_map.local_to_map(global_position)
	# Possible Moves
	var possible_moves = [
		Vector2i(
			current_coords.x + Vector2i.UP.x,
			current_coords.x + Vector2i.UP.y,
			), 
		Vector2i(
			current_coords.x + Vector2i.DOWN.x,
			current_coords.x + Vector2i.DOWN.y,
		),
		Vector2i(
			current_coords.x + Vector2i.LEFT.x,
			current_coords.x + Vector2i.LEFT.y,
		),
		Vector2i(
			current_coords.x + Vector2i.RIGHT.x,
			current_coords.x + Vector2i.RIGHT.y,
		)
		]
		
	for coords in possible_moves:
		if !is_walkable(coords):
			possible_moves.erase(coords)
			
	print(possible_moves)
	return possible_moves

func _has_floor() -> bool:
	return self.tile_map != null
	

	
