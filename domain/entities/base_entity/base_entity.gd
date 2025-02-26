class_name BaseEntity extends CharacterBody2D

var tile_map : TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move(direction: Vector2i):
	# Character current coordinates in the tilemap
	var current_coords : Vector2i = self.tile_map.local_to_map(global_position)
	
	# Target cell coordinates
	var target_coords : Vector2i = Vector2i(
		current_coords.x + direction.x,
		current_coords.y + direction.y
	)
	
	if !is_walkable(target_coords):
		return false
		
	# Move player
	global_position = tile_map.map_to_local(target_coords)
	
	
func is_walkable(target_coords : Vector2i) -> bool:
	## Checks if cell is walkable
	var cell_data : TileData = self.tile_map.get_cell_tile_data(target_coords)
	
	if cell_data == null:
		print("Cell doesnt exists")
		return false
		
	return cell_data.get_custom_data("walkable")
