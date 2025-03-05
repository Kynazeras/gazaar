extends Item

func apply_effects(targets: Array[Node]) -> void:
	var damage_effect := DamageEffect.new()
	var shield_effect := ShieldEffect.new()
	damage_effect.amount = 10
	shield_effect.amount = 10
	print('dealing 10 damage')
	damage_effect.execute(targets)
	shield_effect.execute(targets)
