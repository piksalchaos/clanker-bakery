extends Area2D

@onready var previous_position: Vector2 = global_position

var cakes_to_move: Array[Cake] = []

func start_moving_cakes() -> void:
	for cake: Cake in get_overlapping_areas():
		if cakes_to_move.has(cake):
			continue
		cakes_to_move.append(cake)


func stop_moving_cakes() -> void:
	cakes_to_move = []


func _physics_process(_delta: float) -> void:
	for cake: Cake in cakes_to_move:
		if not is_instance_valid(cake):
			continue
		cake.position.y = global_position.y
