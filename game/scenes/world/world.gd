extends Node2D

@onready var player : Ring = $ring
@onready var platform = $"tile-platform"
@onready var ring_animation = $ring/AnimatedSprite2D
@onready var mouse_points_character : bool = false
var action_mode : int
var current_turn : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set constant values
	action_mode = Action.NONE
	current_turn = Turn.PLAYER
	player.tile_map = platform
	# Set to the origin
	platform.global_position = Vector2i(0,0)
	player.global_position = Vector2i(0,0)
	
	# Assign the map of the level to the entities	
	
	# Assign initial position
	player.global_position = platform.map_to_local(Vector2i(-8,0))
	
	#default animation
	ring_animation.play("default")
	
func _input(event: InputEvent) -> void:
	if action_mode == Action.NONE:
		ring_animation.play("default")
		platform.restore_cells()
		
		return
	
	if event.is_action_pressed("left click") and self.mouse_points_character == false:
		print(player.current_position())
		print(platform.local_to_map(get_global_mouse_position()))
		print("Action")
		#reset highlight
		if action_mode == Action.MOVE:
			print("Move")
			#platform.highlight_move_cells(player.possible_moves)
			player.move(platform.local_to_map(get_global_mouse_position()))
		elif action_mode == Action.ATTACK:
			print("attack")
			player.attack(platform.local_to_map(get_global_mouse_position()))
			
		action_mode = Action.NONE
		ring_animation.play("default")
		platform.restore_cells()
		
	pass


func _on_player_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	player.set_possible_moves()
	if event.is_action_pressed("left click"):
		platform.restore_cells()
		ring_animation.play("hover")
		action_mode = Action.MOVE
		platform.highlight_move_cells(player.possible_moves)
		
	if event.is_action_pressed("right click"):
		platform.restore_cells()
		ring_animation.play("hover")
		action_mode = Action.ATTACK
		platform.highlight_attack_cells(player.possible_attacks)
		
	self.mouse_points_character = true


func _on_player_mouse_exited() -> void:
	self.mouse_points_character = false
