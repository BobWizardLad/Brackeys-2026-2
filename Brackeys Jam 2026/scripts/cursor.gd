extends Area2D
class_name CursorScript

# @onready var object_detection: Area2D = $Area2D
@onready var sprite: Sprite2D = $Sprite2D

@export var cursor_texture: Texture = null
@export var open_hand_texture: Texture = null
@export var closed_hand_texture: Texture = null

var held_object: Node2D = null
var grabbable_object: Node2D = null
var mouse_offset = Vector2(0, 0)

signal left_click_down
signal left_click_up

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	# object_detection.area_entered.connect(_on_area_entered)
	# object_detection.area_exited.connect(_on_area_exited)

func _physics_process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	# _check_for_grabbable_objects()
	if held_object:
		held_object.global_position = get_global_mouse_position() + mouse_offset

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		left_click_down.emit()
	if event.is_action_released("left_click"):
		left_click_up.emit()

func _process(delta: float) -> void:
	pass


# func _check_for_grabbable_objects() -> void:
# 	var overlapping_objects = object_detection.get_overlapping_areas()

# 	if overlapping_objects.size() > 0:
# 		if !held_object:
# 			sprite.texture = open_hand_texture

# 		# Sort descending so the highest z_index is first
# 		overlapping_objects.sort_custom(func(a, b):
# 			return a.z_index > b.z_index
# 		)
		
# 		grabbable_object = overlapping_objects[0]
# 		# Do your grab logic with topmost_object here
# 	else:
# 		sprite.texture = cursor_texture



func _on_area_entered(body: Node2D) -> void:
	sprite.texture = open_hand_texture

func _on_area_exited(body: Node2D) -> void:
	sprite.texture = cursor_texture
