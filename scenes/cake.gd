extends Area2D


func _physics_process(delta: float) -> void:
	# TEMP CODE - do later: apply different velocity on cake whenever it enters a new conveyor
	if get_overlapping_areas().size() > 0:
		position.x -= 25.0 * delta
	# TEMP CODE END
