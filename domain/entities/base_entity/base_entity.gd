class_name BaseEntity extends CharacterBody2D

# PROPERTIES
var tile_map : TileMapLayer
var possible_moves : Array
var possible_attacks : Array

# METHODS
# Checks if a tile map is assigned to the player
func _has_floor() -> bool:
	return self.tile_map != null
	
# Checks if a cell is walkable
func is_walkable(target_coords : Vector2i) -> bool:
	if !_has_floor():
		print("No platform assigned to the player!")
		return false
	## Checks if cell is walkable
	var cell_data : TileData = self.tile_map.get_cell_tile_data(target_coords)
	
	if cell_data == null:
		#print("Cell doesnt exists")
		return false
		
	return cell_data.get_custom_data("walkable")

# Retrieves the current position based on the tile map
func current_position():
	if !_has_floor():
		print("No platform assigned to the player!")
		return false
	return self.tile_map.local_to_map(self.global_position)

# Move player's position given a new one
func move(direction: Vector2i):
	if !_has_floor():
		print("No platform assigned to the player!")
		return false
	
	# Target cell coordinates
	var target_coords : Vector2i = Vector2i(
		current_position().x + direction.x,
		current_position().y + direction.y
	)
	#Checks if the target cell is walkable
	if !is_walkable(target_coords):
		print("Can't walk on air!")
		return false
		
	# Move player
	global_position = tile_map.map_to_local(target_coords)
	
