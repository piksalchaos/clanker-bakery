class_name Conveyor extends Area2D

@export var direction := Vector2(-1, 0)
@export var speed: float = 30.0


func get_velocity() -> Vector2:
	return speed * direction
