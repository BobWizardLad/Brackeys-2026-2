extends CanvasLayer

func overlay_scene(image: String):
	if FileAccess.file_exists(image):
		%Sprite.texture = load(image)
	else:
		push_warning("Cutscene Sequencer: File did not exist " + str(image))
		%Sprite.texture = null
