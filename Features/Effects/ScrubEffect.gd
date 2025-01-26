extends Effect
class_name ScrubEffect

var base_damage: int = 10

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var statuses = target.get_node("StatusesComponent")
		var actual_damage = base_damage
		if statuses:
			actual_damage = statuses.modify_damage("ScrubEffect", base_damage)
		
		var health = target.get_node("HealthComponent")
		if health:
			health.modify(-actual_damage)
		else:
			print("Error: Target does not have a HealthComponent!")
