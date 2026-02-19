class_name Bot extends Node2D


const MAX_VIBRATION: float = 5.0
const VIBRATION_DELTA: float = 30.0
const SPRITE_Y_OFFSET: float = 25.0

@export var positions: Node2D
@export var position_index: int = 0

var _movement_tween: Tween
var _vibration: float = 0.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var cake_mover: Area2D = $CakeMover


func move(position_index_offset: int) -> void:
	var next_position_index: int = position_index + position_index_offset
	position_index = _clamp_position_index(next_position_index)
	if next_position_index == position_index:
		_tween_position_by_index()
		cake_mover.start_moving_cakes()
	else:
		_vibration = MAX_VIBRATION


func play_activate_animation() -> void:
	animated_sprite_2d.play("activate")


func play_idle_animation() -> void:
	animated_sprite_2d.play("idle")


func _ready() -> void:
	position_index = _clamp_position_index(position_index)
	_update_position_by_index()


func _process(delta: float) -> void:
	if _vibration > 0.0:
		animated_sprite_2d.position.y = SPRITE_Y_OFFSET + randf_range(-_vibration/2, _vibration/2)
		_vibration -= VIBRATION_DELTA * delta
	else:
		animated_sprite_2d.position.y = SPRITE_Y_OFFSET
		_vibration = 0.0


func _clamp_position_index(new_position_index: int) -> int:
	return clampi(new_position_index, 0, positions.get_child_count()-1)


func _update_position_by_index() -> void:
	position = positions.get_child(position_index).position


func _tween_position_by_index() -> void:
	if _movement_tween and _movement_tween.is_running():
		_movement_tween.stop()
	
	var final_position: Vector2 = positions.get_child(position_index).position
	_movement_tween = create_tween()
	_movement_tween.tween_property(
			self, "position", final_position, 0.15
			).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	_movement_tween.tween_callback(cake_mover.stop_moving_cakes)
