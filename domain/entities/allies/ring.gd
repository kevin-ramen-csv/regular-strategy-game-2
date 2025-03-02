class_name Ring extends BaseEntity

# PROPERTIES

# METHODS

# Set a list of positions where the entity can move or attack.
func set_possible_moves():
	# Possible Moves
	var current_coord = self.current_position()
	var possible_moves = [
		Vector2i(
			current_coord.x + Vector2i.UP.x,
			current_coord.y + Vector2i.UP.y,
			), 
		Vector2i(
			current_coord.x + Vector2i.DOWN.x,
			current_coord.y + Vector2i.DOWN.y,
		),
		Vector2i(
			current_coord.x + Vector2i.LEFT.x,
			current_coord.y + Vector2i.LEFT.y,
		),
		Vector2i(
			current_coord.x + Vector2i.RIGHT.x,
			current_coord.y + Vector2i.RIGHT.y,
		)
		]
	
	var valid_coords = []
	for coords in possible_moves:
		if self.is_walkable(coords):
			valid_coords.append(coords)
			
	self.possible_moves = valid_coords
	self.possible_attacks = self.possible_moves + [self.current_position()]
