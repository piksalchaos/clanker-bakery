extends Area2D

@export var ingredient: IngredientTypes.Ingredient
@onready var sprite: AnimatedSprite2D = $Sprite


func _ready() -> void:
	sprite.animation = str(ingredient)


func _on_area_entered(cake: Cake) -> void:
	cake.add_ingredient(ingredient)
	sprite.play()
