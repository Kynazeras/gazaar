extends Effect
class_name ShieldEffect

var amount := 0

func execute(targets: Array[Node]) -> void:
	for target in targets:
		if not target:
			continue
		if target:
			target.gain_shield(amount)
