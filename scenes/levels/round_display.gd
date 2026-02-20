class_name RoundDisplay extends PanelContainer

@onready var round_label: Label = $VBoxContainer/RoundLabel
@onready var cake_count_label: Label = $VBoxContainer/CakeCountLabel


func update_round(current_round: int) -> void:
	round_label.text = "ROUND " + str(current_round)

func update_cake_count(cakes_delivered: int, cakes_required: int) -> void:
	cake_count_label.text = str(cakes_delivered) + "/" + str(cakes_required) + " Cakes"
