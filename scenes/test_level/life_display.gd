extends HBoxContainer

# temporary script. will replace with a more sophisticated life manager later

#@onready var game_over_label: Label = $"../GameOverLabel"

func _ready() -> void:
	SignalBus.life_lost.connect(remove_life_heart)

func remove_life_heart() -> void:
	if get_child_count() == 1:
		pass
		#game_over_label.show()
	if get_child_count() > 0:
		get_child(0).queue_free()
