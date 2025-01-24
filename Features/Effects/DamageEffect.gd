extends Effect
class_name DamageEffect

var damage_amount = 10

func execute():
	if target:
		var health = target.get_node("HealthComponent")
		if health:
			health.modify(-damage_amount)
		else:
			print("Error: Target does not have a HealthComponent!")
	else:
		print("Error: No Target found!")
