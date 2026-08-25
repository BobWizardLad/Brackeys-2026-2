extends Interact

@export var new_camera: Camera2D = null

func click() -> void:
	new_camera.make_current()
