extends Area2D

@export var ingredient: IngredientTypes.Ingredient
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ingredient_sprite: Sprite2D = $IngredientSprite


func _ready() -> void:
	ingredient_sprite.frame = ingredient


func _on_area_entered(cake: Cake) -> void:
	cake.add_ingredient(ingredient)
	animated_sprite_2d.set_frame_and_progress(0, 0.0)
	animated_sprite_2d.play()
	animation_player.play("apply_ingredient")
