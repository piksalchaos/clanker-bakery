class_name IngredientTypes

enum Ingredient {
	BASE_CHOCOLATE,
	BASE_VANILLA,
	BASE_ICECREAM,
	ICING_CHOCOLATE,
	ICING_VANILLA,
	ICING_STRAWBERRY,
	TOPPINGS_CHOCOLATE,
	TOPPINGS_FRUIT,
	TOPPINGS_SPRINKLES
}

enum Category { BASE, ICING, TOPPINGS }

const _CATEGORY_MAP = {
	Ingredient.BASE_CHOCOLATE: Category.BASE,
	Ingredient.BASE_VANILLA: Category.BASE,
	Ingredient.BASE_ICECREAM: Category.BASE,
	Ingredient.ICING_CHOCOLATE: Category.ICING,
	Ingredient.ICING_VANILLA: Category.ICING,
	Ingredient.ICING_STRAWBERRY: Category.ICING,
	Ingredient.TOPPINGS_CHOCOLATE: Category.TOPPINGS,
	Ingredient.TOPPINGS_FRUIT: Category.TOPPINGS,
	Ingredient.TOPPINGS_SPRINKLES: Category.TOPPINGS,
}


static func get_category(ingredient: Ingredient) -> Category:
	return _CATEGORY_MAP[ingredient]
