extends Effect
class_name ActionPointEffect

var action_point_cost = 1

func execute():
	var target = GameState.getEffectTarget(target_name)
	if target:
		var action_points = target.get_node("ActionPointsComponent")
		if action_points:
			action_points.modify(-action_point_cost)
		else:
			print("Error: Target does not have a ActionPointsComponent!")
	else:
		print("Error: No Target found!")
