extends Node2D

@onready var screen_size: Vector2 = get_viewport_rect().size
var shape_points := []
var shapes := []

func _ready() -> void:
	for point_count in range(3, 6):
		var points: PackedVector2Array = []
		for i: float in point_count + 1:
			var angle: float = i/point_count * TAU
			points.append(Vector2.RIGHT.rotated(angle))
		shape_points.append(points)
		
	for i in 30:
		_create_shape(true)


func _create_shape(randomize_y: bool = false) -> void:
	var shape_scale := randf_range(10.0, 25.0)
	var y_position: float = randf()*screen_size.y if randomize_y else screen_size.y+shape_scale
	var shape: Dictionary = {
		"shape_points_index": randi_range(0, shape_points.size()-1),
		"scale": shape_scale,
		"rotation": randf() * TAU,
		"angular_velocity": randf_range(0.25, 0.5) * (1.0 if randf() > 0.5 else -1.0),
		"position": Vector2(randf()*screen_size.x, y_position),
		"color": Color.from_hsv(randf(), 0, 1, 0.3)
	}
	shapes.append(shape)


func _process(delta: float) -> void:
	for shape: Dictionary in shapes:
		shape["position"].y -= 0.5 * shape["scale"] * delta
		shape["rotation"] += shape["angular_velocity"] * delta
	queue_redraw()


func _draw() -> void:
	for shape: Dictionary in shapes:
		draw_set_transform(shape["position"], shape["rotation"], Vector2(shape["scale"], shape["scale"]))
		draw_polyline(shape_points[shape["shape_points_index"]], shape["color"], 0.15)


func _on_shape_timer_timeout() -> void:
	_create_shape()
