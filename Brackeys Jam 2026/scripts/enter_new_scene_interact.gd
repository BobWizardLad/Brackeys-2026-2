extends Interact

@export var target_scene_path: String = ""

func left_click_down() -> void:
    SCENE_TRANSITION.change_scene(target_scene_path)