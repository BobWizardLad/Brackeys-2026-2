extends Interact

# 1. Define your enum
enum IngredientChoice { SPRINKLES, ANCHOVIES, PINEAPPLES }

# 2. Type-hint your exported variable with the enum name
@export var ingredient: IngredientChoice

func left_click_down() -> void:
	match ingredient:
		IngredientChoice.SPRINKLES:
			StoryService.has_sprinkles = true
			
		IngredientChoice.ANCHOVIES:
			print("Equipping staff and spellbook!")
			# Code for magician...
			
		IngredientChoice.PINEAPPLES:
			print("Equipping daggers!")
			# Code for thief...
			
		_:
			print("This is the default fallback case (wildcard).")

	queue_free()