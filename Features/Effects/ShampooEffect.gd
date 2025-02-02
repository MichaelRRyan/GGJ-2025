extends Effect
class_name ShampooEffect

var modifier = 3

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var statuses = target.get_node("StatusesComponent")
		if statuses:
			statuses.apply_status("Shampooed", modifier)
		else:
			print("Error: Target does not have StatusesComponent!")
