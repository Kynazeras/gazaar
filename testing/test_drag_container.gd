extends Control

@onready var drag_container: DragContainer = %DropContainerComponent
@onready var table: HBoxContainer = %Table

@export var item_group: ItemGroup

const draggable: PackedScene = preload("res://testing/test_draggable_item.tscn")


func _ready() -> void:
	update_container()
	drag_container.child_dropped.connect(_on_child_dropped)
	drag_container.child_moved_left.connect(item_group.swap_left)
	drag_container.child_moved_right.connect(item_group.swap_right)


func update_container():
	for child in table.get_children():
		child.queue_free()
	for item in item_group.items:
		var drag = draggable.instantiate()
		var label = Label.new()
		label.text = item.name
		drag.add_child(label)
		table.add_child(drag)
		drag_container.setup_drag_item(drag)


func _on_child_dropped():
	update_container()
