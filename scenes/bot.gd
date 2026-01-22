class_name Bot extends Node2D


const MAX_VIBRATION: float = 10.0
const VIBRATION_DELTA: float = 40.0

@export var positions: Node2D
@export var position_index: int = 0

var _vibration: float = 0.0

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var selector_sprite: Sprite2D = $SelectorSprite

func _ready() -> void:
	position_index = _clamp_position_index(position_index)
	_update_position_by_index()


func _process(delta: float) -> void:
	if _vibration > 0.0:
		sprite_2d.position.x = randf_range(-_vibration/2, _vibration/2)
		_vibration -= VIBRATION_DELTA * delta
	else:
		sprite_2d.position.x = 0.0
		_vibration = 0.0


func move(position_index_offset: int) -> void:
	var next_position_index: int = position_index + position_index_offset
	position_index = _clamp_position_index(next_position_index)
	if next_position_index == position_index:
		_tween_position_by_index()
	else:
		_vibration = MAX_VIBRATION


func _clamp_position_index(new_position_index: int) -> int:
	return clampi(new_position_index, 0, positions.get_child_count()-1)


func _update_position_by_index() -> void:
	position = positions.get_child(position_index).position


func _tween_position_by_index() -> void:
	var final_position: Vector2 = positions.get_child(position_index).position
	var tween: Tween = create_tween()
	tween.tween_property(
			self, "position", final_position, 0.15
			).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
