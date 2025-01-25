extends Effect
class_name ExhaustionEffect

var exhaustion_cost = 5

func _init():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	exhaustion_cost = rng.randi_range(1, 10)  # Generate a random integer between 1 and 10

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var exhaustion_amount = target.get_node("ExhaustionComponent")
		if exhaustion_amount:
			exhaustion_amount.modify(-exhaustion_cost)
		else:
			print("Error: Target does not have a ExhaustionComponent!")
	else:
		print("Error: No Target found!")
