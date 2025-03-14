extends Node2D

@onready var player : Ring = $ring
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
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left click") and self.mouse_points_character == false:
		platform.restore_cells()
		print("Action")
		#reset highlight
		if action_mode == Action.action.MOVE:
			#platform.highlight_move_cells(player.possible_moves)
			player.move(platform.local_to_map(get_local_mouse_position()))
		else:
			player.attack(platform.local_to_map(get_local_mouse_position()))
		
		action_mode = Action.action.NONE
	pass


func _on_player_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	player.set_possible_moves()
	if event.is_action_pressed("left click"):
		action_mode = Action.action.MOVE
		platform.highlight_move_cells(player.possible_moves)
		
	if event.is_action_pressed("right click"):
		action_mode = Action.action.ATTACK
		platform.highlight_attack_cells(player.possible_attacks)
		
	self.mouse_points_character = true


func _on_player_mouse_exited() -> void:
	self.mouse_points_character = false
