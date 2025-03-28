extends Item

func apply_effects(targets: Array[Node]) -> void:
	var damage_effect := DamageEffect.new()
	var shield_effect := ShieldEffect.new()
	damage_effect.amount = 20
	shield_effect.amount = 10
	damage_effect.execute(targets)
	shield_effect.execute(targets)
