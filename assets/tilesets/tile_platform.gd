class_name BasePlatform extends TileMapLayer

#PROPERTIES
var cells_changes : Array
var cell_map = {}
#METHODS
# Maps cells health
func change_health(coords : Vector2i):
	var health : int
	
	if !self.cell_map.has(coords):
		var cell : TileData = self.get_cell_tile_data(coords)
		health = cell.get_custom_data("times_clicked") - 1
		cell_map[coords] = Cell.new(coords,health)
		print(cell," Current health: ", health)
	else:
		var cell : Cell = self.cell_map[coords]
		cell.health -= 1
		health = cell.health
		print(cell," Current health: ", cell.health)
		print(self.cell_map[coords])
	
	if health == 5:
		return
	
	if health == 4:
		self.highlight_cell([coords],CellSprite.LEVEL1_4HP)
		return
	
	if health == 3:
		self.highlight_cell([coords],CellSprite.LEVEL1_3HP)
		return
	
	if health == 2:
		self.highlight_cell([coords],CellSprite.LEVEL1_2HP)
		return
	
	if health == 1:
		self.highlight_cell([coords],CellSprite.LEVEL1_1HP)
		return
		
	if health <= 0:
		self.cell_map.erase(coords)
		self.erase_cell(coords)
		return
		
	return

# Highlights a certain area.
func highlight_cell(cells_coords : Array, cell_sprite_data: Dictionary = {}, restore: bool = false) -> void:
	if restore:
		if self.cells_changes == null or self.cells_changes == []:
			print("No changes have been made!")
			return 
		
		for cell_info in self.cells_changes:
			self.set_cell(
				cell_info["cell_coords"],
				cell_info["source"],
				cell_info["atlas"],
				cell_info["alternative"]
				)
	else:
		if cell_sprite_data == {}:
			print("No changes have been made!")
			return
			
		# Saves changes only if the current cell is not a highlighted one.
		for cell in cells_coords:
			var source = get_cell_source_id(cell)
			var atlas = get_cell_atlas_coords(cell)
			var alt = get_cell_alternative_tile(cell)
			
			if isHighlightSprite(source,atlas,alt):
				continue
				
			self.cells_changes.append(
				{
					"cell_coords":cell,
					"source":source,
					"atlas":atlas,
					"alternative":alt
				}
			)
			
			# Change cells sprites
		for cell in cells_coords:
			self.set_cell(
				cell,
				cell_sprite_data["SOURCE"],
				cell_sprite_data["ATLAS"],
				cell_sprite_data["ALTERNATIVE"]
				)
				
func isHighlightSprite(source_id: int, atlas_coords: Vector2i, alternative: int) -> bool:
	for sprite in CellSprite.HIGHLIGHTS_LIST:
		if sprite["SOURCE"] == source_id and sprite["ATLAS"] == atlas_coords and sprite["ALTERNATIVE"] == alternative:
			return true
	return false
