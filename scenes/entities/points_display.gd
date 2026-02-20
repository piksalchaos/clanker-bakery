class_name PointsDisplay extends Node2D

const POSITION_TWEEN_OFFSET = Vector2(0, -20)

@export var points: int = 0
@export var are_points_scored := true

@onready var points_label: Label = $PointsLabel

func _ready() -> void:
	if are_points_scored:
		SignalBus.points_scored.emit(points)
	points_label.text = str(points)
	var tween := get_tree().create_tween()
	tween.tween_property(self, "position", position + POSITION_TWEEN_OFFSET, 0.5) \
			.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "modulate", Color("00ff5d", 0), 0.3)
	tween.tween_callback(queue_free)
