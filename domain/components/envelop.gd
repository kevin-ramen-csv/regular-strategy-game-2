class_name Envelop

var can_move : bool
var target_coords : Vector2i

func _init(can_move : bool, target_coords : Vector2i) -> void:
	self.can_move = can_move
	self.target_coords = target_coords
	
