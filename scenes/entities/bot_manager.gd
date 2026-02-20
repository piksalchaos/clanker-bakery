extends Node2D

@export var bot_container: Node2D
@export var bot_index: int = 0
@export var bot_particles: BotParticles

@onready var switch_bot_audio: AudioStreamPlayer = $SwitchBotAudio


func change_bot_index(offset: int) -> void:
	switch_bot_audio.pitch_scale = randf_range(0.75, 1.5)
	switch_bot_audio.play()
	_get_bot().play_idle_animation()
	var child_count: int = bot_container.get_child_count()
	bot_index = (bot_index + offset + child_count) % child_count
	_get_bot().play_activate_animation()
	bot_particles.set_bot_with_tween(_get_bot())


func move_bot(position_index_offset: int) -> void:
	_get_bot().move(position_index_offset)
	if bot_particles.is_tweening:
		bot_particles.tween_to_position(_get_bot().incoming_position)


func _get_bot() -> Bot:
	return bot_container.get_child(bot_index)


func _ready() -> void:
	bot_container.get_child(bot_index).play_activate_animation()
	bot_particles.bot = _get_bot()


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
