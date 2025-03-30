class_name DragContainer
extends Node

@export var container: Control

var currently_selected_item = null
# Get a list of items (player table / player inventory)

func _ready() -> void:
    for child in container.get_children():
        child.drag_and_drop.drag_started.connect(_on_child_drag_started)
        child.drag_and_drop.drag_cancelled.connect(_on_child_drag_cancelled)
        child.drag_and_drop.dropped.connect(_on_child_dropped)


func _on_child_drag_started():
    pass


func _on_child_drag_cancelled():
    pass


func _on_child_dropped(_child: Control):
    pass