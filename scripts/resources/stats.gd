extends Resource
class_name Stats

const MAX_HEALTH = 1000000

signal stats_changed
signal died

enum STAT_TYPE { HEALTH, SHIELD }

@export var max_health: int = 300
@export var current_health: int = 0
@export var shield_amount: int = 0


func take_damage(amount: int) -> void:
    var damage_amount = clampi(amount - shield_amount, 0, amount)
    shield_amount = clampi(shield_amount - amount, 0, shield_amount)
    current_health -= damage_amount
    stats_changed.emit()
    if(current_health <= 0):
        died.emit()


func get_shield(amount: int) -> void:
    var added_shield_amount = clampi(amount, 0, amount)
    shield_amount += added_shield_amount
    stats_changed.emit()

func get_stat_percentage(query: STAT_TYPE):
    var value
    match query:
        STAT_TYPE.HEALTH:
            value = (float(current_health) / max_health) * 100
        STAT_TYPE.SHIELD:
            value = (float(shield_amount) / 100) * 100
        _:
            value = 100
    return value