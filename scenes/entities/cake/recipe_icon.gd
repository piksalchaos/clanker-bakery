class_name RecipeIcon extends Node2D

@onready var ingredient_sprite: Sprite2D = $IngredientSprite
@onready var mark_sprite: Sprite2D = $MarkSprite


func set_ingredient(ingredient: IngredientTypes.Ingredient) -> void:
	ingredient_sprite.frame = ingredient

func set_mark(is_successful: bool) -> void:
	mark_sprite.frame = 0 if is_successful else 1
	mark_sprite.show()
