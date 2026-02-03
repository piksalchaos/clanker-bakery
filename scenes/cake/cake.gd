class_name Cake extends Area2D

@export var recipe: Recipe

@onready var sprites: Node2D = $Sprites


func _ready() -> void:
	set_ingredient(IngredientTypes.Ingredient.BASE_CHOCOLATE)
	set_ingredient(IngredientTypes.Ingredient.ICING_STRAWBERRY)
	set_ingredient(IngredientTypes.Ingredient.TOPPINGS_FRUIT)


func set_ingredient(ingredient: IngredientTypes.Ingredient) -> void:
	sprites.add_ingredient(ingredient)


func _physics_process(delta: float) -> void:
	# TEMP CODE - do later: apply different velocity on cake whenever it enters a new conveyor
	if get_overlapping_areas().size() > 0:
		position.x -= 25.0 * delta
