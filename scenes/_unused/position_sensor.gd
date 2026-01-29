class_name PositionSensor extends Node2D

signal position_changed(position_delta: Vector2)
signal movement_started
signal movement_stopped

var _is_position_changed_last_frame := false

@onready var previous_position: Vector2 = global_position


func _physics_process(_delta: float) -> void:
	if previous_position == global_position:
		if _is_position_changed_last_frame:
			movement_stopped.emit()
			_is_position_changed_last_frame = false
		return
	
	position_changed.emit(global_position - previous_position)
	if not _is_position_changed_last_frame:
		movement_started.emit()
		_is_position_changed_last_frame = true
	previous_position = global_position
