extends Node

const MAX_LIVES: int = 3


var _lives: int = 3:
	set(value):
		_lives = value
		hud.update_lives(value)
var _round: int = 1:
	set(value):
		_round = value
		hud.update_round(_round)
var _cakes_delivered: int = 0:
	set(value):
		_cakes_delivered = value
		hud.update_cake_count(_cakes_delivered, _cakes_required)
var _cakes_required: int = 4:
	set(value):
		_cakes_required = value
		hud.update_cake_count(_cakes_delivered, _cakes_required)
var _score: int = 0:
	set(value):
		_score = value
		hud.update_score(value)

@onready var hud: Control = $HUD


func _ready() -> void:
	hud.initialize_values(_lives, _round, _cakes_delivered, _cakes_required)
	SignalBus.life_lost.connect(_on_life_lost)
	SignalBus.cake_delivered.connect(_on_cake_delivered)


func _on_life_lost() -> void:
	_lives -= 1


func _on_cake_delivered() -> void:
	_cakes_delivered += 1
	if _cakes_delivered == _cakes_required:
		_cakes_delivered = 0
		_cakes_required += 4
		_round += 1
