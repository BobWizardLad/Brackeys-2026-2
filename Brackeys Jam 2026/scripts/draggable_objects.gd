extends Interact
class_name Draggable_Object

var selected = false
var mouse_offset = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected:
		followMouse()

func followMouse():
	position = get_global_mouse_position() + mouse_offset	

func left_click_down() -> void:
	selected = true
	mouse_offset = global_position - get_global_mouse_position()

func left_click_up() -> void:
	selected = false

func stop_dragging() -> void:
	selected = false