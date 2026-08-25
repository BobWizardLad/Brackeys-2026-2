extends Interact

@export var new_camera: Camera2D = null

func left_click_down() -> void:
	SCENE_TRANSITION.change_camera(new_camera)
