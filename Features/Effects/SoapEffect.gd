extends Effect
class_name SoapEffect

var scrub_multiplier = 2

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var statuses = target.get_node("StatusesComponent")
		if statuses:
			statuses.applyStatus()
		else:
			print("Error: Target does not have a ActionPointsComponent!")
	else:
		print("Error: No Target found!")
