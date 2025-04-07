extends PanelContainer
class_name ItemUI

@onready var cooldown_component: CooldownComponent = $CooldownComponent
@onready var item_name: Label = %ItemName
@onready var icon: TextureRect = %Icon
@onready var cooldown_progress: ProgressBar = %CooldownProgress
@onready var targets: Array[Node] = []
@onready var drag_and_drop: DragAndDrop = %DragAndDropComponent

@export var item: Item : set = _set_item

var SMALL_SIZE = Vector2(50,100)
var MEDIUM_SIZE = Vector2(100,100)
var LARGE_SIZE = Vector2(200,100)


const SWORD = preload("res://data/items/sword.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	item = SWORD
	cooldown_component.cooldown_ended.connect(trigger_item)


func _set_item(value: Item):
	item = value
	icon.texture = value.icon
	item_name.text = value.name
	cooldown_component.initialize(value.base_cooldown)
	match value.size:
		Constants.ItemSize.SMALL:
			custom_minimum_size = SMALL_SIZE
			pivot_offset = SMALL_SIZE / 2
		Constants.ItemSize.MEDIUM:
			custom_minimum_size = MEDIUM_SIZE
			pivot_offset = MEDIUM_SIZE / 2
		Constants.ItemSize.LARGE:
			custom_minimum_size = LARGE_SIZE
			pivot_offset = LARGE_SIZE / 2
		_:
			custom_minimum_size = MEDIUM_SIZE
			pivot_offset = MEDIUM_SIZE / 2


func trigger_item():
	if not item:
		return
		
	item.trigger(targets)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	cooldown_progress.value = cooldown_component.get_time_left_percent()

