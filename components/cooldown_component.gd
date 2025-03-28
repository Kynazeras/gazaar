extends Node
class_name CooldownComponent

signal cooldown_ended

@export var base_cooldown: float = 5.0
@onready var cooldown: Timer = $Cooldown


# Called when the node enters the scene tree for the first time.
func _ready():
	cooldown.wait_time = base_cooldown
	cooldown.timeout.connect(on_timer_ended)

func initialize(cooldown_time: float):
	cooldown.wait_time = cooldown_time
	cooldown.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func on_timer_ended():
	cooldown_ended.emit()


func get_time_left_percent():
	return (cooldown.time_left / cooldown.wait_time) * 100
	

func reduce_cooldown_percent(percent: float):
	var base_cooldown_reduction = (percent * cooldown.wait_time) / 100
	cooldown.wait_time = cooldown.wait_time - base_cooldown_reduction
	
