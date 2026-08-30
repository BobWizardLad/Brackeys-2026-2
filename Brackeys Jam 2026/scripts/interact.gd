extends Area2D
class_name Interact

func _ready() -> void:
    area_entered.connect(_area_entered)
    area_exited.connect(_area_exited)

func _area_entered(area: Area2D) -> void:
    if area is CursorScript:
        area.left_click_down.connect(left_click_down)
        area.left_click_up.connect(left_click_up)
    if area is PizzaObject && is_in_group("character"):
        area.position = Vector2(-100, -100)
        area.stop_dragging()
        pizza_interact()

func _area_exited(area: Area2D) -> void:
    if area is CursorScript:
        area.left_click_down.disconnect(left_click_down)
        area.left_click_up.disconnect(left_click_up)

func left_click_down() -> void:
    return

func left_click_up() -> void:
    return

func pizza_interact() -> void:
    return