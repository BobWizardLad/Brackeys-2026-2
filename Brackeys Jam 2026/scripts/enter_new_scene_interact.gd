extends Interact

@export var target_scene_path: String = ""

func click() -> void:
    SCENE_TRANSITION.change_scene(target_scene_path)