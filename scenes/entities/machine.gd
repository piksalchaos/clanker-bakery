extends Area2D

@export var ingredient: IngredientTypes.Ingredient


func _on_area_entered(cake: Cake) -> void:
	cake.add_ingredient(ingredient)
