extends Control
class_name ItemUI

@onready var cooldown_component: CooldownComponent = $CooldownComponent
@onready var item_name: Label = %"Item Name"
@onready var icon: TextureRect = %Icon
@onready var cooldown_progress: ProgressBar = %CooldownProgress

@onready var targets: Array[Node] = []
@export var item: Item : set = _set_item

var SMALL_SIZE = Vector2(50,100)
var MEDIUM_SIZE = Vector2(100,100)
var LARGE_SIZE = Vector2(200,100)


const SWORD = preload("res://data/items/sword.tres")
const HAMMER = preload("res://data/items/hammer.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_item(SWORD)

func _set_item(value: Item):
	item = value
	icon.texture = value.icon
	item_name.text = value.name
	cooldown_component.initialize(value.base_cooldown)
	cooldown_component.cooldown_ended.connect(trigger_item)
	match value.size:
		Constants.ItemSize.SMALL:
			size = SMALL_SIZE
		Constants.ItemSize.MEDIUM:
			size = MEDIUM_SIZE
		Constants.ItemSize.LARGE:
			size = LARGE_SIZE
		_:
			size = MEDIUM_SIZE


func trigger_item():
	if not item:
		return
		
	item.trigger(targets)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	cooldown_progress.value = cooldown_component.get_time_left_percent()
