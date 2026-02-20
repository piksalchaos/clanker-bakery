class_name Cake extends Area2D

const POINTS_DISPLAY = preload("uid://bdbef7pq4lnyl")
const FALL_POSITION_OFFSET := Vector2(0, 50)

@export var recipe: Recipe
var is_moving := true
var velocity := Vector2.ZERO
var correct_ingredient_count: int = 0

@onready var sprites: Node2D = $Sprites
@onready var recipe_display: Node2D = $RecipeDisplay


func _ready() -> void:
	recipe_display.set_icons(recipe)


func add_ingredient(ingredient: IngredientTypes.Ingredient) -> void:
	if sprites.has_category(IngredientTypes.get_category(ingredient)):
		return
	sprites.add_ingredient(ingredient)
	var category := IngredientTypes.get_category(ingredient)
	var is_correct_ingredient := recipe.get_ingredient(category) == ingredient
	recipe_display.set_ingredient_success(category, is_correct_ingredient)
	if is_correct_ingredient:
		correct_ingredient_count += 1
		var points_display: PointsDisplay = POINTS_DISPLAY.instantiate()
		# probably better if the points system is centralized in the level scene, but this'll do for now
		points_display.points = 200
		points_display.position = Vector2(0.0, -20.0)
		add_child(points_display)
	else:
		SignalBus.life_lost.emit()


func _physics_process(delta: float) -> void:
	if is_moving:
		position += velocity * delta


func _on_area_entered(conveyor: Conveyor) -> void:
	velocity = conveyor.get_velocity()


func _on_area_exited(_area: Area2D) -> void:
	if get_overlapping_areas().size() == 0 and not is_queued_for_deletion():
		fall_down()


func fall_down() -> void:
	is_moving = false
	var tween := get_tree().create_tween()
	tween.tween_property(
			self, "position", position + FALL_POSITION_OFFSET, 0.5
			).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)
	tween.tween_callback(SignalBus.life_lost.emit)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.5)
	tween.tween_callback(queue_free)
