extends Node2D

const CAKE = preload("uid://cse3ktqjdgusv")

@export var spawn_positions: Node2D
@export var container: Node2D
@export var start_time: float = 6.0
@export var cake_spawn_time: float = 10.0

@onready var spawn_timer: Timer = $SpawnTimer


func _ready() -> void:
	await get_tree().create_timer(start_time).timeout
	spawn_timer.wait_time = cake_spawn_time
	spawn_timer.start()
	spawn_cake()


func _on_spawn_timer_timeout() -> void:
	spawn_cake()


func spawn_cake() -> void:
	var cake: Cake = CAKE.instantiate()
	cake.position = get_random_spawn_position()
	cake.recipe = Recipe.create_random()
	container.add_child(cake)


func get_random_spawn_position() -> Vector2:
	var node: Node2D = spawn_positions.get_child(randi_range(0, spawn_positions.get_child_count()-1))
	return node.global_position
