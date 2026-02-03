extends Node2D

@onready var base_icon: Sprite2D = $BaseIcon
@onready var icing_icon: Sprite2D = $IcingIcon


func set_icons(recipe: Recipe) -> void:
	base_icon.frame = recipe.base
	icing_icon.frame = recipe.icing
