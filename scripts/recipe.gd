class_name Recipe extends Resource

@export_enum("Chocolate:0", "Vanilla:1", "Ice Cream:2") var base: int
@export_enum("Chocolate:3", "Vanilla:4", "Strawberry:5") var icing: int
@export_enum("Chocolate:6", "Fruit:7", "Sprinkles:8") var toppings: int


static func create_random() -> Recipe:
	var recipe := Recipe.new()
	recipe.base = randi_range(0, 2)
	recipe.icing = randi_range(3, 5)
	recipe.toppings = randi_range(6, 8)
	return recipe
