extends Area2D


func _on_area_entered(cake: Cake) -> void:
	cake.queue_free()
