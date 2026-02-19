class_name HUD extends Control

@onready var life_display: LifeDisplay = $LifeDisplay
@onready var round_display: RoundDisplay = $RoundDisplay

func initialize_values(
	lives: int,
	current_round: int,
	cakes_delivered: int,
	cakes_required: int,
) -> void:
	life_display.create_lives(lives)
	update_round(current_round)
	update_cake_count(cakes_delivered, cakes_required)


func update_lives(lives: int) -> void:
	life_display.update_lives(lives)


func update_round(current_round: int) -> void:
	round_display.update_round(current_round)


func update_cake_count(cakes_delivered: int, cakes_required: int) -> void:
	round_display.update_cake_count(cakes_delivered, cakes_required)


func update_score(_score: int) -> void:
	pass
