extends MarginContainer
class_name CharacterBars

@onready var bar_container: VBoxContainer = %BarContainer
@onready var health_bar: ProgressBar = %HealthBar
@onready var shield_bar: ProgressBar = %ShieldBar

func invert_bars():
    bar_container.move_child(bar_container.get_child(0),1)