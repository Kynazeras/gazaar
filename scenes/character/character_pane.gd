extends MarginContainer
class_name CharacterPane

@export var inverted: bool = false
@export var stats: Stats : set = _set_stats

@onready var character_bars: CharacterBars = %CharacterBars


func _ready() -> void:
    if inverted:
        character_bars.invert_bars()


func _set_stats(value: Stats):
    stats = value
    update_stats()


func update_stats() -> void:
    character_bars.health_bar.value = stats.get_stat_percentage(Stats.STAT_TYPE.HEALTH)
    character_bars.shield_bar.value = stats.get_stat_percentage(Stats.STAT_TYPE.SHIELD)
