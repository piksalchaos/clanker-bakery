extends Control

var _is_alive: bool = true
@onready var animated_rect: AnimatedRect = $AnimatedRect

func kill() -> void:
	if not _is_alive:
		return
	_is_alive = false
	animated_rect.play("kill")
