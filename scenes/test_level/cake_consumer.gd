extends Area2D

const POINTS_DISPLAY = preload("uid://bdbef7pq4lnyl")


func _on_area_entered(cake: Cake) -> void:
	SignalBus.cake_delivered.emit()
	cake.queue_free()
	if cake.correct_ingredient_count > 0:
		var points_display: PointsDisplay = POINTS_DISPLAY.instantiate()
		points_display.points = cake.correct_ingredient_count * 150
		points_display.position = cake.position + Vector2(40.0, -20.0)
		add_child(points_display)
