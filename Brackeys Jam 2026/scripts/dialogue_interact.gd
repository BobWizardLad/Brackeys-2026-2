class_name DialogueInteract extends Interact

signal clicked

func left_click_down() -> void:
	clicked.emit()
	return

func left_click_up() -> void:
	return
