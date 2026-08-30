extends Draggable_Object
class_name PizzaObject

var has_sauce: bool
var has_pep: bool
var has_cheese: bool
var has_sprinkles: bool
var has_anchovies: bool
var has_pineapple: bool
var has_vicodin: bool
var has_bolts: bool

var start_pos: Vector2

func _ready() -> void:
    super()
    start_pos = position

    StoryFlags.moved_camera.connect(_reset_za_spot)

    if !StoryFlags.current_pizza:
        position = Vector2(-100, -100)
        return
    if StoryFlags.current_pizza.has_sauce:
        $SauceOnPizza.visible = true
    if StoryFlags.current_pizza.has_pep:
        $PepOnPizza.visible = true
    if StoryFlags.current_pizza.has_cheese:
        $CheeseOnPizza.visible = true
    if StoryFlags.current_pizza.has_sprinkles:
        $SprinkOnPizza.visible = true

func _reset_za_spot() -> void:
    if !StoryFlags.current_pizza:
        position = Vector2(-100, -100)
        return
    position = start_pos