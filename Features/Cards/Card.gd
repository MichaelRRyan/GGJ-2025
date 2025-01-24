extends Resource
class_name Card

# Name and description for UI
var name: String
var description: String
var effect: Effect

func play():
	if effect:
		effect.execute()
	else:
		print("Error: Card has no effect!")
