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
		var valid_cells = player.valid_moves()
		highlight_cell(valid_cells, 1)
	if Input.is_action_just_pressed("down"):
		prints(player.global_position, platform.local_to_map(player.global_position))
		player.move(Vector2i.DOWN)
		var valid_cells = player.valid_moves()
		highlight_cell(valid_cells, 1)
	if Input.is_action_just_pressed("left"):
		prints(player.global_position, platform.local_to_map(player.global_position))
		player.move(Vector2i.LEFT)
		var valid_cells = player.valid_moves()
		highlight_cell(valid_cells, 1)
	if Input.is_action_just_pressed("right"):
		prints(player.global_position, platform.local_to_map(player.global_position))
		player.move(Vector2i.RIGHT)
		var valid_cells = player.valid_moves()
		highlight_cell(valid_cells, 1)
	pass


func _on_player_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left click"):
		print("Character clicked")
		# Show Possible paths
		var valid_cells = player.valid_moves()
		highlight_cell(valid_cells,7)
		
	if event.is_action_pressed("right click"):
		print("Character clicked")
		# Show Possible paths
		var valid_cells = player.valid_moves()
		highlight_cell(valid_cells,3)
		
	pass # Replace with function body.
	
func highlight_cell(valid_cells : Array, source_id : int)-> Array:
	for cell_coords in valid_cells:
		platform.set_cell(cell_coords,source_id,Vector2i.ZERO)
	return valid_cells
