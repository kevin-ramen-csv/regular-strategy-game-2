extends Node2D

@onready var player = $player
@onready var platform = $"tile-platform"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set to the origin
	platform.global_position = Vector2i(0,0)
	player.global_position = Vector2i(0,0)
	
	#Assign the map of the level to the 
	player.tile_map = platform
	
	player.global_position = platform.map_to_local(Vector2i(-8,0))
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		prints(player.global_position, platform.local_to_map(player.global_position))
		player.move(Vector2i.UP)
	if Input.is_action_just_pressed("down"):
		prints(player.global_position, platform.local_to_map(player.global_position))
		player.move(Vector2i.DOWN)
	if Input.is_action_just_pressed("left"):
		prints(player.global_position, platform.local_to_map(player.global_position))
		player.move(Vector2i.LEFT)
	if Input.is_action_just_pressed("right"):
		prints(player.global_position, platform.local_to_map(player.global_position))
		player.move(Vector2i.RIGHT)
