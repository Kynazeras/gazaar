class_name DragAndDrop
extends Node

signal drag_started()
signal dropped(target: Control)
signal drag_cancelled

@export var target: Control

var dragging := false
# var original_parent: Control = null

func _ready() -> void:
    # print(target.get_rect().has_point(Vector2(700,700)))
    target.gui_input.connect(_on_target_gui_input)


func _process(_delta: float) -> void:
    if dragging and target:
        target.global_position = target.get_global_mouse_position() - Vector2.ZERO


func _input(event: InputEvent) -> void:
    if dragging and event.is_action_released('select'):
        _drop()
    if dragging and event.is_action_pressed('cancel'):
        _cancel_drag()


func _start_drag():
    drag_started.emit()
    dragging = true
    target.z_index = 99
    target.global_position = target.get_global_mouse_position() - Vector2.ZERO


func _drop():
    dropped.emit(target)
    print(target)
    dragging = false


func _cancel_drag():
    drag_cancelled.emit()
    dragging = false
    target.z_index = 0


func _on_target_gui_input(event: InputEvent):
    if not dragging and event.is_action_pressed("select"):
        _start_drag()