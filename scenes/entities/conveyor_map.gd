extends Node2D

const CONVEYOR = preload("uid://d3vkei1mcmiby")
const ATLAS_COORD_DIRECTION_MAP: Dictionary[Vector2i, Vector2i] = {
	Vector2i(0, 0): Vector2i.UP,
	Vector2i(0, 1): Vector2i.RIGHT,
	Vector2i(0, 2): Vector2i.DOWN,
	Vector2i(0, 3): Vector2i.LEFT,
}

@export var direction_layer: TileMapLayer
@export var conveyor_container: Node2D

func _ready() -> void:
	direction_layer.hide()
	var tile_size := Vector2(direction_layer.tile_set.tile_size)
	for coords: Vector2i in direction_layer.get_used_cells():
		var atlas_coords := direction_layer.get_cell_atlas_coords(coords)
		
		var conveyor: Conveyor = CONVEYOR.instantiate()
		conveyor.direction = ATLAS_COORD_DIRECTION_MAP[atlas_coords]
		conveyor.position = (Vector2(coords) + Vector2(0.5, 0.5)) * tile_size
		
		conveyor_container.add_child(conveyor)
