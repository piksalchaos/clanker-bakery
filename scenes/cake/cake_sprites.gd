extends Node2D

@onready var pan_sprite: Sprite2D = $PanSprite
@onready var ingredient_sprites: Dictionary[IngredientTypes.Category, Sprite2D] = {
	IngredientTypes.Category.BASE: $BaseSprite,
	IngredientTypes.Category.ICING: $IcingSprite,
	IngredientTypes.Category.TOPPINGS: $ToppingsSprite,
}


func add_ingredient(ingredient: IngredientTypes.Ingredient) -> void:
	var sprite := ingredient_sprites[IngredientTypes.get_category(ingredient)]
	sprite.frame = ingredient
	sprite.show()
