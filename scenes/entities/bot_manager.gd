extends Node2D

@export var bot_container: Node2D
@export var bot_index: int = 0


func change_bot_index(offset: int) -> void:
	var bot: Bot = bot_container.get_child(bot_index)
	bot.play_idle_animation()
	var child_count: int = bot_container.get_child_count()
	bot_index = (bot_index + offset + child_count) % child_count
	bot = bot_container.get_child(bot_index)
	bot.play_activate_animation()


func move_bot(position_index_offset: int) -> void:
	var bot: Bot = bot_container.get_child(bot_index)
	bot.move(position_index_offset)


func _ready() -> void:
	bot_container.get_child(bot_index).play_activate_animation()


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
