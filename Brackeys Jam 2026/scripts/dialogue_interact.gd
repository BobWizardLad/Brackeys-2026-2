class_name DialogueInteract extends Interact

signal clicked
signal pizza_given

func left_click_down() -> void:
	clicked.emit()
	return

func left_click_up() -> void:
	return

func pizza_interact() -> void:
	print("given Pizza")
	pizza_given.emit()
	return