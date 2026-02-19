extends Control

@onready var animated_rect: AnimatedRect = $AnimatedRect


func kill() -> void:
	animated_rect.play("kill")
