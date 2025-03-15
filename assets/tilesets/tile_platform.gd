class_name BasePlatform extends TileMapLayer

#PROPERTIES
var last_possible_moves : Array
var cell_map = {}
#METHODS
# Maps cells health
func change_health(coords : Vector2i):
	var health : int
	
	if !self.cell_map.has(coords):
		var cell : TileData = self.get_cell_tile_data(coords)
		health = cell.get_custom_data("health") - 1
		cell_map[coords] = Cell.new(coords,health)
		print(cell," Current health: ", health)
	else:
		var cell : Cell = self.cell_map[coords]
		cell.health -= 1
		health = cell.health
		print(cell," Current health: ", cell.health)
		print(self.cell_map[coords])
	
	var cell_sprite_data : Dictionary =  {}
	
	if health == 4:
		cell_sprite_data = CellSprite.LEVEL1_4HP
	elif health == 3:
		cell_sprite_data = CellSprite.LEVEL1_3HP
	elif health == 2:
		cell_sprite_data = CellSprite.LEVEL1_2HP
	elif health == 1:
		cell_sprite_data = CellSprite.LEVEL1_1HP
	else:
		self.cell_map.erase(coords)
		self.erase_cell(coords)
		return
		
	self.set_cell(
			coords,
			cell_sprite_data["SOURCE"],
			cell_sprite_data["ATLAS"],
			cell_sprite_data["ALTERNATIVE"]
		)
	return
	
				
func highlight_move_cells(cells_coords : Array):
	last_possible_moves = cells_coords
	for coord in cells_coords:
		var cell_data : TileData = self.get_cell_tile_data(coord)
		var cell_sprite_data : Dictionary =  {}
		if cell_data.get_custom_data("health") == 5:
			cell_sprite_data = CellSprite.LEVEL1_MOVE_HIGHLIGHT_5HP
		elif cell_data.get_custom_data("health") == 4:
			cell_sprite_data = CellSprite.LEVEL1_MOVE_HIGHLIGHT_4HP
		elif cell_data.get_custom_data("health") == 3:
			cell_sprite_data = CellSprite.LEVEL1_MOVE_HIGHLIGHT_3HP
		elif cell_data.get_custom_data("health") == 2:
			cell_sprite_data = CellSprite.LEVEL1_MOVE_HIGHLIGHT_2HP
		else:
			cell_sprite_data = CellSprite.LEVEL1_MOVE_HIGHLIGHT_1HP
			
		self.set_cell(
			coord,
			cell_sprite_data["SOURCE"],
			cell_sprite_data["ATLAS"],
			cell_sprite_data["ALTERNATIVE"]
		)
	
func highlight_attack_cells(cells_coords : Array):
	last_possible_moves = cells_coords
	for coord in cells_coords:
		var cell_data : TileData = self.get_cell_tile_data(coord)
		var cell_sprite_data : Dictionary =  {}
		if cell_data.get_custom_data("health") == 5:
			cell_sprite_data = CellSprite.LEVEL1_ATTACK_HIGHLIGHT_5HP
		elif cell_data.get_custom_data("health") == 4:
			cell_sprite_data = CellSprite.LEVEL1_ATTACK_HIGHLIGHT_4HP
		elif cell_data.get_custom_data("health") == 3:
			cell_sprite_data = CellSprite.LEVEL1_ATTACK_HIGHLIGHT_3HP
		elif cell_data.get_custom_data("health") == 2:
			cell_sprite_data = CellSprite.LEVEL1_ATTACK_HIGHLIGHT_2HP
		else:
			cell_sprite_data = CellSprite.LEVEL1_ATTACK_HIGHLIGHT_1HP
			
		self.set_cell(
			coord,
			cell_sprite_data["SOURCE"],
			cell_sprite_data["ATLAS"],
			cell_sprite_data["ALTERNATIVE"]
		)
		
func restore_cells():
	for coord in self.last_possible_moves:
		var cell_data : TileData = self.get_cell_tile_data(coord)
		var cell_sprite_data : Dictionary =  {}
		
		if cell_data == null:
			continue
		
		if cell_data.get_custom_data("health") == 5:
			cell_sprite_data = CellSprite.LEVEL1_5HP
		elif cell_data.get_custom_data("health") == 4:
			cell_sprite_data = CellSprite.LEVEL1_4HP
		elif cell_data.get_custom_data("health") == 3:
			cell_sprite_data = CellSprite.LEVEL1_3HP
		elif cell_data.get_custom_data("health") == 2:
			cell_sprite_data = CellSprite.LEVEL1_2HP
		else:
			cell_sprite_data = CellSprite.LEVEL1_1HP
			
		self.set_cell(
			coord,
			cell_sprite_data["SOURCE"],
			cell_sprite_data["ATLAS"],
			cell_sprite_data["ALTERNATIVE"]
		)
