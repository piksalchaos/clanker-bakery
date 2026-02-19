extends TextureRect


@export var hframes: int = 1
@export var vframes: int = 1
@export var animations: Array[AtlasAnimation]
@export var animation_name: String
@export var is_autoplay: bool = false

var _frame_index: int = 0

@onready var frame_timer: Timer = $FrameTimer


func play(new_animation: String = animation_name, starting_frame_index: int = 0) -> void:
	animation_name = new_animation
	_frame_index = starting_frame_index
	_set_atlas_frame_to_index()
	frame_timer.wait_time = _get_animation().frame_duration
	frame_timer.start()


func _set_atlas_frame(frame: int) -> void:
	if texture is AtlasTexture:
		@warning_ignore("integer_division")
		var frame_coords := Vector2(frame % hframes, frame / vframes)
		texture.region.position = texture.region.size * frame_coords


func _set_atlas_frame_to_index() -> void:
	_set_atlas_frame(_get_animation().frames[_frame_index])


func _get_animation() -> AtlasAnimation:
	for animation: AtlasAnimation in animations:
		if animation.name == animation_name:
			return animation
	return null


func _on_frame_timer_timeout() -> void:
	_frame_index += 1
	if _frame_index == _get_animation().frames.size():
		if _get_animation().is_loop:
			_frame_index = 0
		else:
			frame_timer.stop()
			return
	_set_atlas_frame_to_index()


func _ready() -> void:
	if texture is AtlasTexture:
		texture.region.size = texture.atlas.get_size() / Vector2(hframes, vframes)
		print(texture.region.size)
	if is_autoplay:
		play()
