extends Draggable_Object

@export var max_scale: Vector2 = Vector2(1.5, 1.5)
@export var grow_duration: float = 1.0
@export var flattened_texture: Texture2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var sauce: Sprite2D = $SauceOnPizza
@onready var pep: Sprite2D = $PepOnPizza
@onready var cheese: Sprite2D = $CheeseOnPizza
@onready var sprink: Sprite2D = $SprinkOnPizza

var is_growing: bool = false
var has_flattened: bool = false

func _ready() -> void:
	super()
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("rolling_pin"):
		start_growing()
	if area.is_in_group("sauce"):
		sauce.visible = true
	if area.is_in_group("pep"):
		pep.visible = true
	if area.is_in_group("cheese"):
		cheese.visible = true
	if area.is_in_group("sprink"):
		sprink.visible = true

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
