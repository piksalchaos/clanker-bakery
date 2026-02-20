class_name ScoreDisplay extends PanelContainer

const TOTAL_DIGITS: int = 10
@onready var score_label: Label = $HBoxContainer/ScoreLabels/ScoreLabel
@onready var high_score_label: Label = $HBoxContainer/ScoreLabels/HighScoreLabel


func _ready() -> void:
	high_score_label.text = get_score_string(Globals.high_score)


func update_score(score: int) -> void:
	score_label.text = get_score_string(score)
	high_score_label.text = get_score_string(Globals.high_score)

func get_score_string(score: int) -> String:
	var score_digits: int = 0 if score == 0 else str(score).length()
	if score_digits == 0:
		return "0".repeat(TOTAL_DIGITS)
	if score_digits < TOTAL_DIGITS:
		return "0".repeat(TOTAL_DIGITS - score_digits) + str(score)
	return str(score)
