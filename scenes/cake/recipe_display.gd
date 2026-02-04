extends Node2D

@onready var ingredient_icons: Dictionary[IngredientTypes.Category, RecipeIcon] = {
	IngredientTypes.Category.BASE: $BaseIcon,
	IngredientTypes.Category.ICING: $IcingIcon,
}

func set_icons(recipe: Recipe) -> void:
	for category: IngredientTypes.Category in ingredient_icons.keys():
		ingredient_icons[category].set_ingredient(recipe.get_ingredient(category))

func set_ingredient_success(category: IngredientTypes.Category, is_successful: bool = true) -> void:
	ingredient_icons[category].set_mark(is_successful)
