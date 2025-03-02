extends Node2D

@onready var player : Ring = $player
@onready var platform = $"tile-platform"
@onready var mouse_points_character : bool = false
var action_mode : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set to the origin
	platform.global_position = Vector2i(0,0)
	player.global_position = Vector2i(0,0)
	
	# Assign the map of the level to the entities
	player.tile_map = platform
	
	# Assign initial position
	player.global_position = platform.map_to_local(Vector2i(-8,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if self.mouse_points_character:
		#return
	#if Input.is_action_pressed("left click"):
		##reset highlight
		#platform.highlight_cell(player.possible_moves,{},true)
		#if action_mode == Action.action.MOVE:
			#player.move(platform.local_to_map(get_local_mouse_position()))
		#else:
			#player.attack(platform.local_to_map(get_local_mouse_position()))
			#print("Not Implemented!")
	##print("Mouse", get_local_mouse_position(), platform.local_to_map(get_local_mouse_position()))
	##if event.is_action_pressed("left click"):
		##print(player.current_position())
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left click") and self.mouse_points_character == false:
		print("Action")
		#reset highlight
		platform.highlight_cell(player.possible_moves,{},true)
		if action_mode == Action.action.MOVE:
			player.move(platform.local_to_map(get_local_mouse_position()))
		else:
			player.attack(platform.local_to_map(get_local_mouse_position()))
	#if Input.is_action_pressed("left click") and self.mouse_points_character == false:
		##reset highlight
		#platform.highlight_cell(player.possible_moves,{},true)
		#if action_mode == Action.action.MOVE:
			#player.move(platform.local_to_map(get_local_mouse_position()))
		#else:
			#player.attack(platform.local_to_map(get_local_mouse_position()))
			#print("Not Implemented!")
	pass


func _on_player_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	player.set_possible_moves()
	if event.is_action_pressed("left click"):
		action_mode = Action.action.MOVE
		#reset highlight
		platform.highlight_cell(player.possible_moves,{},true)
		print("Character clicked")
		# Show Possible paths
		platform.highlight_cell(player.possible_moves,CellSprite.LEVEL1_MOVE_HIGHLIGHT)
		
	if event.is_action_pressed("right click"):
		action_mode = Action.action.ATTACK
		#reset highlight
		platform.highlight_cell(player.possible_moves,{},true)
		print("Character clicked")
		# Show Possible paths
		platform.highlight_cell(player.possible_attacks,CellSprite.LEVEL1_ATTACK_HIGHLIGHT)
		
	self.mouse_points_character = true


func _on_player_mouse_exited() -> void:
	self.mouse_points_character = false

func moves_by_keyboard():
	#if Input.is_action_just_pressed("up"):
		#prints(player.global_position, platform.local_to_map(player.global_position))
		#player.move(Vector2i.UP)
		#var valid_cells = player.valid_moves()
	#if Input.is_action_just_pressed("down"):
		#prints(player.global_position, platform.local_to_map(player.global_position))
		#player.move(Vector2i.DOWN)
		#var valid_cells = player.valid_moves()
	#if Input.is_action_just_pressed("left"):
		#prints(player.global_position, platform.local_to_map(player.global_position))
		#player.move(Vector2i.LEFT)
		#var valid_cells = player.valid_moves()
	#if Input.is_action_just_pressed("right"):
		#prints(player.global_position, platform.local_to_map(player.global_position))
		#player.move(Vector2i.RIGHT)
		#var valid_cells = player.valid_moves()
	pass
