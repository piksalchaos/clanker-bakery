class_name LifeDisplay extends HBoxContainer

const LIFE_HEART = preload("uid://dbih5wf0ul0oj")


func create_lives(lives: int) -> void:
	for i in lives:
		add_child(LIFE_HEART.instantiate())

func update_lives(lives: int) -> void:
	if lives < 0:
		return
	for i in get_child_count() - lives:
		get_child(i).kill()


func _ready() -> void:
	for child in get_children():
		child.queue_free()
