class_name BasePlatform extends TileMapLayer

#PROPERTIES
var cells_changes : Array

#METHODS
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
