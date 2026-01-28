class_name PositionSensor extends Node2D

signal position_changed(position_delta: Vector2)


@onready var previous_position: Vector2 = global_position


func _physics_process(_delta: float) -> void:
	if previous_position == global_position: return
	position_changed.emit(global_position - previous_position)
	previous_position = global_position
