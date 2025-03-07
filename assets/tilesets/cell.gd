class_name Cell 

var coords : Vector2i
var health : int

func _init(coords: Vector2i, health : int) -> void:
	self.coords = coords
	self.health = health
