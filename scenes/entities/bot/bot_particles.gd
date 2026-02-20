class_name BotParticles extends CPUParticles2D

const POSITION_OFFSET = Vector2(0.0, 25.0)

@export var bot: Bot
var is_tweening := false


func set_bot_with_tween(new_bot: Bot) -> void:
	bot = new_bot
	tween_to_bot()


func tween_to_bot() -> void:
	tween_to_position(bot.global_position)


func tween_to_position(new_position: Vector2) -> void:
	is_tweening = true
	var tween := get_tree().create_tween()
	tween.tween_property(self, "position", POSITION_OFFSET + new_position, 0.15) \
			.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(func() -> void: is_tweening = false)


func _process(_delta: float) -> void:
	if is_tweening:
		return
	position = POSITION_OFFSET + bot.global_position
