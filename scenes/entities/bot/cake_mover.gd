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
	#print(cakes_to_move.size())
	#if previous_position == global_position:
		#return
	#var position_delta: Vector2 = global_position - previous_position
	#previous_position = global_position
	#if cakes_to_move.size() == 0:
		#return
	for cake: Cake in cakes_to_move:
		cake.position.y = global_position.y

#
#class_name PositionSensor extends Node2D
#
#signal position_changed(position_delta: Vector2)
#signal movement_started
#signal movement_stopped
#
#var _is_position_changed_last_frame := false
#
#
#
#func _physics_process(_delta: float) -> void:
	#if previous_position == global_position:
		#if _is_position_changed_last_frame:
			#movement_stopped.emit()
			#_is_position_changed_last_frame = false
		#return
	#
	#position_changed.emit(global_position - previous_position)
	#if not _is_position_changed_last_frame:
		#movement_started.emit()
		#_is_position_changed_last_frame = true
	#previous_position = global_position
