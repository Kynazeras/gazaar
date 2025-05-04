extends VBoxContainer

@export var stats: Stats

@onready var pane: CharacterPane = %CharacterPane
@onready var table: ItemTable = %ItemTable

func _ready() -> void:
	pane.stats = stats
