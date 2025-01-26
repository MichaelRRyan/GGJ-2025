extends Effect
class_name SoapEffect

var statusDuration = 1

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var statuses = target.get_node("StatusesComponent")
		if statuses:
			statuses.apply_status("Soaped", statusDuration)
		else:
			print("Error: Target does not have StatusesComponent!")
