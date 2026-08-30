extends Interact
class_name EnterNewSceneInteract

@export var target_scene_path: String = ""

@export var kitchen_door: bool = false

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

static var start_dialogue: Callable = func(with_dialogue_resource: DialogueResource, from_cue: String, extra_game_states: Array) -> Node:
	return Engine.get_singleton("DialogueManager").show_dialogue_balloon(with_dialogue_resource, from_cue, extra_game_states)

signal leaving

func left_click_down() -> void:
	leaving.emit()
	if !kitchen_door:
		SCENE_TRANSITION.change_scene(target_scene_path)
	else:
		if StoryFlags.detective_ready_for_pizza:
			SCENE_TRANSITION.change_scene(target_scene_path)
		else:
			if is_instance_valid(dialogue_resource) and not dialogue_cue.is_empty():
				dialogue_balloon = start_dialogue.call(dialogue_resource, dialogue_cue, [{ actionable = self }, owner])