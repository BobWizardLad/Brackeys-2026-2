extends Node2D

@onready var sprink: Area2D = $Sprink

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if StoryService.has_sprinkles:
		sprink.position = Vector2(900, 640)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
