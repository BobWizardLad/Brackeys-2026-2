extends Area2D
class_name Interact

func _ready() -> void:
    area_entered.connect(_area_entered)
    area_exited.connect(_area_exited)

func _area_entered(area: Area2D) -> void:
    if area is CursorScript:
        area.left_click_down.connect(left_click_down)
        area.left_click_up.connect(left_click_up)

func _area_exited(area: Area2D) -> void:
    if area is CursorScript:
        area.left_click_down.disconnect(left_click_down)
        area.left_click_up.disconnect(left_click_up)

func left_click_down() -> void:
    return

func left_click_up() -> void:
    return


