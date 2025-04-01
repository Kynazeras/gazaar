class_name DragContainer
extends Node

signal child_dropped
signal child_moved_right(index: int)
signal child_moved_left(index: int)

@export var container: Control

var currently_selected_item = null
# Get a list of items (player table / player inventory)

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	for child in container.get_children():
		if child.drag_and_drop.dragging:
			change_order(child.get_index())


func change_order(index: int) -> void:
	var child = container.get_child(index)
	var threshold = child.size.x / 2
	var prev_child = container.get_child(index - 1)
	var next_child = container.get_child(index + 1)
	if index > 0 and child.position.x < (prev_child.position.x + threshold):
		swap_left(index)
	elif index < (container.get_children().size() - 1) and child.position.x > (next_child.position.x - threshold):
		swap_right(index)
	else:
		return


func swap_left(index: int):
	var child = container.get_child(index)
	if index > 0:
		container.move_child(child, index - 1)
		child_moved_left.emit(index)


func swap_right(index: int):
	var child = container.get_child(index)
	if index < container.get_children().size() - 1:
		container.move_child(child, index + 1)
		child_moved_right.emit(index)


func setup_drag_item(item: Control):
		item.drag_and_drop.drag_started.connect(_on_child_drag_started)
		item.drag_and_drop.drag_cancelled.connect(_on_child_drag_cancelled)
		item.drag_and_drop.dropped.connect(_on_child_dropped)
		print(item.drag_and_drop)
		item.drag_and_drop.freedom = DragAndDrop.DRAG_FREEDOM.X_LOCKED


func _on_child_drag_started():
	pass


func _on_child_drag_cancelled():
	pass


func _on_child_dropped(_child: Control):
	child_dropped.emit()
