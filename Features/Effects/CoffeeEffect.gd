extends Effect
class_name CoffeeEffect

var exhaustion_released = 12

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var exhaustion_amount = target.get_node("ExhaustionComponent")
		if exhaustion_amount:
			exhaustion_amount.modify(exhaustion_released)
		else:
			print("Error: Target does not have a ExhaustionComponent!")
	else:
		print("Error: No Target found!")
