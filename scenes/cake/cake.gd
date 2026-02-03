class_name Cake extends Area2D

@export var recipe: Recipe

@onready var sprites: Node2D = $Sprites
@onready var recipe_icons: Node2D = $RecipeIcons


func _ready() -> void:
	recipe_icons.set_icons(recipe)


func add_ingredient(ingredient: IngredientTypes.Ingredient) -> void:
	sprites.add_ingredient(ingredient)


func _physics_process(delta: float) -> void:
	# TEMP CODE - do later: apply different velocity on cake whenever it enters a new conveyor
	if get_overlapping_areas().size() > 0:
		position.x -= 30.0 * delta
