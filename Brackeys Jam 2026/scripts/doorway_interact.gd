extends Interact

@export var new_camera: Camera2D = null

func click() -> void:
	SCENE_TRANSITION.change_camera(new_camera)
