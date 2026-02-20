class_name LifeDisplay extends HBoxContainer

const LIFE_HEART = preload("uid://dbih5wf0ul0oj")


func create_lives(lives: int) -> void:
	for i in lives:
		add_child(LIFE_HEART.instantiate())

func update_lives(lives: int) -> void:
	if lives <= 0: # temp code
		get_tree().call_deferred("change_scene_to_file", "res://scenes/test_menu.tscn") # temp code
		return # temp code
	for i in get_child_count() - lives:
		get_child(i).kill()


func _ready() -> void:
	for child in get_children():
		child.queue_free()
