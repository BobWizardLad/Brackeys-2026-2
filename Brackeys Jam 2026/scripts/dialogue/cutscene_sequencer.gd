extends CanvasLayer

func overlay_scene(image: String):
	if ResourceLoader.exists(image):
		%Sprite.texture = load(image)
	else:
		push_warning("Cutscene Sequencer: File did not exist " + str(image))
		%Sprite.texture = null
