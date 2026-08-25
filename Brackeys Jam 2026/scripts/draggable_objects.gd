extends Area2D
class_name Draggable_Object

var selected = false
var mouse_offset = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("input_event", Callable(self, "_on_input_event"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected:
		followMouse()

func followMouse():
	position = get_global_mouse_position() + mouse_offset	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mouse_offset = position - get_global_mouse_position()
			selected = true
		else:
			selected = false