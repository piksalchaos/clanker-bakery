extends Area2D


func _physics_process(delta: float) -> void:
	# TEMP CODE - do later: apply different velocity on cake whenever it enters a new conveyor
	if get_overlapping_areas().size() > 0:
		position.x -= 25.0 * delta
	# TEMP CODE END


func _on_area_entered(area: Area2D) -> void:
	for child in area.get_children():
		if child is PositionSensor:
			child.position_changed.connect(apply_position_delta)


func _on_area_exited(area: Area2D) -> void:
	for child in area.get_children():
		if child is PositionSensor:
			child.position_changed.disconnect(apply_position_delta)


func apply_position_delta(position_delta: Vector2) -> void:
	position += position_delta
