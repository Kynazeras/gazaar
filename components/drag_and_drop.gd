class_name DragAndDrop
extends Node

enum DRAG_FREEDOM {FREE, X_LOCKED, Y_LOCKED}

signal drag_started()
signal dropped(target: Control)
signal drag_cancelled

@export var target: Control
@export var freedom: DRAG_FREEDOM = DRAG_FREEDOM.FREE

var dragging := false
# var original_parent: Control = null

func _ready() -> void:
    # print(target.get_rect().has_point(Vector2(700,700)))
    target.gui_input.connect(_on_target_gui_input)


func _process(_delta: float) -> void:
    if dragging and target:
        match freedom:
            DRAG_FREEDOM.FREE:
                target.global_position = target.get_global_mouse_position() - Vector2.ZERO
            DRAG_FREEDOM.X_LOCKED:
                target.global_position.x = target.get_global_mouse_position().x - Vector2.ZERO.x
            DRAG_FREEDOM.Y_LOCKED:
                target.global_position.y = target.get_global_mouse_position().y - Vector2.ZERO.y
            _:
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


func _drop():
    dropped.emit(target)
    dragging = false


func _cancel_drag():
    drag_cancelled.emit()
    dragging = false
    target.z_index = 0


func _on_target_gui_input(event: InputEvent):
    if not dragging and event.is_action_pressed("select"):
        _start_drag()