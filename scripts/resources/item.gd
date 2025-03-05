extends Resource
class_name Item

@export_category('Data')
@export var name: String = ''
@export var base_cooldown: float = 5.0
@export var size: Constants.ItemSize = Constants.ItemSize.SMALL
@export var tags: Array[Constants.ItemTag] = []
@export_category('Visuals')
@export var icon: Texture2D


func trigger(targets: Array[Node]) -> void:
	apply_effects(targets)
		

func apply_effects(targets):
	pass
