extends Node
class_name StatsComponent

@export var stats: Stats

signal died


func  _ready() -> void:
    pass


func take_damage(amount: int) -> void:
    var damage_amount = clamp(amount, 1, 1000)
    stats.current_health -= damage_amount
    if(stats.current_health <= 0):
        died.emit()