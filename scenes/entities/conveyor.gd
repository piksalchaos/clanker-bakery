class_name Conveyor extends Area2D

@export var direction := Vector2i(-1, 0)
@export var speed: float = 30.0

var _connected_sides: Array[Vector2i]

@onready var sprite: Sprite2D = $Sprite2D


func get_velocity() -> Vector2:
	return speed * direction


func add_connected_side(side: Vector2i) -> void:
	_connected_sides.append(side)


func _ready() -> void:
	#TEMP CODE START - CHANGE WHEN I HAVE FULL CONVEYOR TILESET
	if _connected_sides.has(Vector2i.LEFT) and _connected_sides.has(Vector2i.RIGHT):
		sprite.frame = 1
	elif _connected_sides.has(Vector2.LEFT):
		sprite.frame = 2
	elif _connected_sides.has(Vector2.RIGHT):
		sprite.frame = 0
	else:
		sprite.frame = 3
	#TEMP CODE END
