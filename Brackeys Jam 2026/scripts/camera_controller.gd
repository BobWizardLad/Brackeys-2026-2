extends Camera2D

@export var min_limit: Vector2 = Vector2(-500, -300)
@export var max_limit: Vector2 = Vector2(500, 300)
@export var pan_speed: float = 1.0

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
        # Move the camera opposite to the mouse drag direction
        position -= event.relative * pan_speed
        
        # Clamp the position between min and max limits
        position.x = clamp(position.x, min_limit.x, max_limit.x)
        position.y = clamp(position.y, min_limit.y, max_limit.y)
