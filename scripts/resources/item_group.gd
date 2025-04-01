class_name ItemGroup
extends Resource

const MAX_ITEM_SLOTS = 10

@export var items: Array[Item] = []

func swap_left(index: int):
	var temp: Item
	if index > 0:
		temp = items[index]
		items[index] = items[index - 1]
		items[index - 1] = temp


func swap_right(index: int):
	var temp: Item
	if index < items.size() - 1:
		temp = items[index]
		items[index] = items[index + 1]
		items[index + 1] = temp
