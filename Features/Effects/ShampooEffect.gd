extends Effect
class_name ShampooEffect

var statusDuration = 1

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var statuses = target.get_node("StatusesComponent")
		if statuses:
			statuses.apply_status("Shampooed", statusDuration)
		else:
			print("Error: Target does not have StatusesComponent!")
