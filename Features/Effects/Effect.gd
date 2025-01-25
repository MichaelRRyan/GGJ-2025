extends Resource
class_name Effect

# Player or Spirit string that we later use to find the entity to affect
var target_name: GameState.TargetName

func execute():
	# Abstract method. To be overridden by child classes.
	pass
