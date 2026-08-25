extends Area2D

@export var max_scale: Vector2 = Vector2(1.5, 1.5)
@export var grow_duration: float = 1.0
@export var flattened_texture: Texture2D

@onready var sprite: Sprite2D = $Sprite2D

var is_growing: bool = false
var has_flattened: bool = false

func _ready() -> void:
	# Connect the area signal
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("area_entered", Callable(self, "_on_area_entered"))

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("rolling_pin"):
		start_growing()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("rolling_pin"):
		start_growing()

func start_growing() -> void:
	if is_growing or has_flattened:
		return
		
	is_growing = true
	var tween = create_tween()
	
	# Scale up smoothly
	tween.tween_property(self, "scale", max_scale, grow_duration)
	
	# Change sprite when growing finishes
	tween.tween_callback(Callable(self, "_change_sprite"))

func _change_sprite() -> void:
	if flattened_texture:
		sprite.texture = flattened_texture
	has_flattened = true
	is_growing = false
