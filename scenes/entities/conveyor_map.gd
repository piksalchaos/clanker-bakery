extends TileMapLayer

const CONVEYOR = preload("uid://d3vkei1mcmiby")
const ATLAS_COORD_DIRECTION_MAP: Dictionary[Vector2i, Vector2i] = {
	Vector2i(0, 0): Vector2i.UP,
	Vector2i(0, 1): Vector2i.RIGHT,
	Vector2i(0, 2): Vector2i.DOWN,
	Vector2i(0, 3): Vector2i.LEFT,
}

@export var conveyor_manager: ConveyorManager

func _ready() -> void:
	hide()
	for coords: Vector2i in get_used_cells():
		var atlas_coords := get_cell_atlas_coords(coords)
		
		var conveyor: Conveyor = CONVEYOR.instantiate()
		conveyor.direction = ATLAS_COORD_DIRECTION_MAP[atlas_coords]
		conveyor.position = (Vector2(coords) + Vector2(0.5, 0.5)) * Vector2(tile_set.tile_size)
		
		# TEMP CODE START - CHANGE TO ADAPT TO ALL CONVEYOR TYPES LATER
		var left_coords := get_neighbor_cell(coords, TileSet.CELL_NEIGHBOR_LEFT_SIDE)
		var right_coords := get_neighbor_cell(coords, TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
		if get_cell_atlas_coords(left_coords) == atlas_coords:
			conveyor.add_connected_side(Vector2i(-1, 0))
		if get_cell_atlas_coords(right_coords) == atlas_coords:
			conveyor.add_connected_side(Vector2i(1, 0)) 
		#TEMP CODE END
		
		conveyor_manager.add_child(conveyor)
