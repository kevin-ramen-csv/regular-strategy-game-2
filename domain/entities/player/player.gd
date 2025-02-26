extends BaseEntity

# Called when an input event occurs whilst mouse touches collision box
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_released("clicked"):
		# Show Possible paths
		print("Character clicked")
	pass # Replace with function body.
