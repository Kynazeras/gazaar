extends MarginContainer

@onready var drag_container: DragContainer = %DragContainerComponent
@onready var table: HBoxContainer = %Table

@export var item_group: ItemGroup

const draggable: PackedScene = preload("res://scenes/item.tscn")

func _ready() -> void:
	update_container()
	drag_container.child_dropped.connect(_on_child_dropped)
	drag_container.child_moved_left.connect(item_group.swap_left)
	drag_container.child_moved_right.connect(item_group.swap_right)

func update_container():
	for child in table.get_children():
		child.queue_free()
	for item in item_group.items:
		var drag: ItemUI = draggable.instantiate()
		table.add_child(drag)
		drag.item = item
		drag_container.setup_drag_item(drag)


func _on_child_dropped():
	update_container()
