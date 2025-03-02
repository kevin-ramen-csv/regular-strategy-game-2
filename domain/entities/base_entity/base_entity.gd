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
		
	if !cell_data.get_custom_data("walkable"):
		print("Can't walk on air!")
		
	return cell_data.get_custom_data("walkable")

# Retrieves the current position based on the tile map
func current_position():
	if !_has_floor():
		print("No platform assigned to the player!")
		return false
	return self.tile_map.local_to_map(self.global_position)

# Move player's position given a new one
func move(target_coords: Vector2i):
	#print(target_coords)
	#print(self.possible_moves)
	if !self.possible_moves.has(target_coords):
		print("Can't go any further!")
		return
	# Move player
	global_position = tile_map.map_to_local(target_coords)
	
# Attack given position
func attack(target_coords: Vector2i):
	#print(target_coords)
	#print(self.possible_moves)
	if !self.possible_attacks.has(target_coords):
		print("Can't go any further!")
		return
	# attack
	var cell_data : TileData = self.tile_map.get_cell_tile_data(target_coords)
	
	if cell_data == null:
		#print("Cell doesnt exists")
		return false
		
	var tile_health = cell_data.get_custom_data("times_clicked") + 1
	print("times_clicked",cell_data.get_custom_data("times_clicked"))
	print("health",tile_health)
	
	if tile_health == 5:
		self.tile_map.erase_cell(target_coords)
	elif tile_health == 4:
		self.tile_map.highlight_cell([target_coords],CellSprite.LEVEL1_1HP)
		cell_data.set_custom_data("times_clicked",tile_health)
	elif tile_health == 3:
		self.tile_map.highlight_cell([target_coords],CellSprite.LEVEL1_2HP)
		cell_data.set_custom_data("times_clicked",tile_health)
	elif tile_health == 2:
		self.tile_map.highlight_cell([target_coords],CellSprite.LEVEL1_3HP)
		cell_data.set_custom_data("times_clicked",tile_health)
	elif tile_health == 1:
		self.tile_map.highlight_cell([target_coords],CellSprite.LEVEL1_4HP)
		cell_data.set_custom_data("times_clicked",tile_health)
	
	
