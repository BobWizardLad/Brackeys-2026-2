extends Area2D
class_name Interact

func _ready() -> void:
    area_entered.connect(_area_entered)
    area_exited.connect(_area_exited)

func _area_entered(area: Area2D) -> void:
    if area is CursorScript:
        area.left_click_down.connect(click)

func _area_exited(area: Area2D) -> void:
    if area is CursorScript:
        area.left_click_down.disconnect(click)

func click() -> void:
    return


