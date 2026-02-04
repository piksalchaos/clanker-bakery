class_name Recipe extends Resource

@export_enum("Chocolate:0", "Vanilla:1", "Ice Cream:2") var base: int = 0
@export_enum("Chocolate:3", "Vanilla:4", "Strawberry:5") var icing: int = 3
@export_enum("Chocolate:6", "Fruit:7", "Sprinkles:8") var toppings: int = 6


static func create_random() -> Recipe:
	var recipe := Recipe.new()
	recipe.base = randi_range(0, 2)
	recipe.icing = randi_range(3, 5)
	recipe.toppings = randi_range(6, 8)
	return recipe


func get_ingredient(category: IngredientTypes.Category) -> IngredientTypes.Ingredient:
	var ingredient: int = 0
	match category:
		IngredientTypes.Category.BASE:
			ingredient = base
		IngredientTypes.Category.ICING:
			ingredient = icing
		IngredientTypes.Category.TOPPINGS:
			ingredient = toppings
	return ingredient as IngredientTypes.Ingredient
