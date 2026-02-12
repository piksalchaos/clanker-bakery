extends Node2D

@onready var screen_size: Vector2 = get_viewport_rect().size
var shape_points := []
var shapes := []


func _create_shape() -> void:
	var shape: Dictionary = {
		"point_count": randi_range(3, 6),
		"scale": randf_range(20.0, 60.0),
		"rotation": randf() * TAU,
		"rotational_direction": 1 if randf() > 0.5 else -1,
		"position": Vector2(randf()*screen_size.x, screen_size.y),
		"color": Color.from_hsv(randf(), 0.1, 1, randf_range(0.3, 0.7))
	}
	shapes.append(shape)


func _process(delta: float) -> void:
	for shape: Dictionary in shapes:
		shape["position"].y -= 50.0 * delta
		shape["rotation"] += 0.5 * shape["rotational_direction"] * delta
	queue_redraw()


func _draw() -> void:
	for shape: Dictionary in shapes:
		var points: PackedVector2Array = []
		var point_count: int = shape["point_count"]
		for i: float in point_count + 1:
			var angle: float = i/point_count * TAU
			points.append(Vector2.RIGHT.rotated(angle))
		draw_set_transform(shape["position"], shape["rotation"], Vector2(shape["scale"], shape["scale"]))
		draw_polyline(points, shape["color"], 0.15)


func _on_shape_timer_timeout() -> void:
	_create_shape()
