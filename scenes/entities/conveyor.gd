class_name Conveyor extends Area2D

const DIRECTION_ANIMATION_MAP: Dictionary[Vector2i, String] = {
	Vector2i.LEFT: "left",
	Vector2i.RIGHT: "right",
	Vector2i.DOWN: "down",
	Vector2i.UP: "up",
}

@export var direction := Vector2i(-1, 0)
@export var speed: float = 25.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func get_velocity() -> Vector2:
	return speed * direction


func _ready() -> void:
	animated_sprite_2d.play(DIRECTION_ANIMATION_MAP[direction])
