extends Node2D

@onready var sprink: Area2D = $Sprink
@onready var exit_door: EnterNewSceneInteract = $ExitDoor
@onready var pizza_cooking_object: PizzaCookingObject = $PizzaObject

## The [DialogueResource] to use when starting dialogue.
@export var dialogue_resource: DialogueResource = null:
	set(value):
		dialogue_resource = value
		if dialogue_resource == null:
			dialogue_cue = ""
		notify_property_list_changed()
	get:
		return dialogue_resource

## The target cue to start dialogue from.
@export var dialogue_cue: String = ""

var dialogue_balloon: Node

## The method used to start dialogue action [code]action()[/code] is called. Override if you need different logic.
static var start_dialogue: Callable = func(with_dialogue_resource: DialogueResource, from_cue: String, extra_game_states: Array) -> Node:
	return Engine.get_singleton("DialogueManager").show_dialogue_balloon(with_dialogue_resource, from_cue, extra_game_states)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_door.leaving.connect(_prepare_pizza_on_leave)
	if StoryFlags.has_sprinkles:
		sprink.position = Vector2(900, 640)

	if !StoryFlags.entered_kitchen_first_time:
		if is_instance_valid(dialogue_resource) and not dialogue_cue.is_empty():
			dialogue_balloon = start_dialogue.call(dialogue_resource, dialogue_cue, [{ actionable = self }, owner])
		
		StoryFlags.entered_kitchen_first_time = true
	# actioned.emit()


func _prepare_pizza_on_leave() -> void:
	if pizza_cooking_object.ingredient_count < 2:
		return
	var cookedPizza = PizzaObject.new()
	if pizza_cooking_object.sauce.visible:
		cookedPizza.has_sauce = true
	if pizza_cooking_object.cheese.visible:
		cookedPizza.has_cheese = true
	if pizza_cooking_object.pep.visible:
		cookedPizza.has_pep = true
	if pizza_cooking_object.sprink.visible:
		cookedPizza.has_sprinkles = true
	
	StoryFlags.current_pizza = cookedPizza

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
