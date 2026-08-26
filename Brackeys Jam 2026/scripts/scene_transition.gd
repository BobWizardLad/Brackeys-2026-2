extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	pass


func change_camera(target_camera) -> void:
	# Block input during transition
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Fade out
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	
	# Change scene while screen is black
	target_camera.make_current()
	
	# Fade in
	animation_player.play("fade_to_normal")
	await animation_player.animation_finished
	
	# Unblock input
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

func change_scene(target_scene_path: String) -> void:
	# Block input during transition
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Fade out
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	
	# Change scene while screen is black
	get_tree().change_scene_to_file(target_scene_path)
	
	# Fade in
	animation_player.play("fade_to_normal")
	await animation_player.animation_finished
	
	# Unblock input
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
