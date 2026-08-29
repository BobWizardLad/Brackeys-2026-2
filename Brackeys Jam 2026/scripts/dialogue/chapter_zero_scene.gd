extends Node2D

@onready var dialogue_object: DialogueActionable2D = $DialogueActionable

func _ready() -> void:
	dialogue_object.action()
