extends Node2D


@export var bot_index: int = 0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_bot_to_left"):
		change_bot_index(-1)
		return
	if event.is_action_pressed("switch_bot_to_right"):
		change_bot_index(1)
		return
	
	
	if event.is_action_pressed("move_bot_down"):
		move_bot(1)
		return
	if event.is_action_pressed("move_bot_up"):
		move_bot(-1)
		return


func change_bot_index(offset: int) -> void:
	var bot: Bot = get_child(bot_index) # temp code
	bot.selector_sprite.hide() # temp code
	var child_count: int = get_child_count()
	bot_index = (bot_index + offset + child_count) % child_count
	bot = get_child(bot_index) # temp code
	bot.selector_sprite.show()

func move_bot(position_index_offset: int) -> void:
	var bot: Bot = get_child(bot_index)
	bot.move(position_index_offset)
