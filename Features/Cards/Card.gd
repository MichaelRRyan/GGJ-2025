extends Resource
class_name Card

# Name and description for UI
var name: String
var description: String
var effects : Array = []

func play():
	for effect in effects:
		if effect:
			effect.execute()
		else:
			print("Error: Card has no effect!")
			
			
func get_card_action_cost() -> int:
	for effect in effects:
		if effect is ActionPointEffect:
			return effect.action_point_cost
	
	return 0
