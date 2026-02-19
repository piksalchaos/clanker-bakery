extends Node

const MAX_LIVES: int = 3

@export var life_display: LifeDisplay

var _lives: int = 3:
	set(value):
		_lives = value
		life_display.update_lives(value)


func _ready() -> void:
	life_display.create_lives(_lives)
	SignalBus.life_lost.connect(_on_life_lost)


func _on_life_lost() -> void:
	_lives -= 1
