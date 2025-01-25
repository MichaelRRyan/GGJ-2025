static func create_card(name: String, description: String, effect: Effect) -> Card:
	# Create the card with the name, description and assign the effect
	var card = Card.new()
	card.name = name
	card.description = description
	card.effect = effect

	return card
	

static func get_damage_card(target : String) -> Card:
	var damage_effect = DamageEffect.new()
	damage_effect.target_string = target
	var damage_card = create_card("DamageCard", "Deal damage to the player.", damage_effect)
	return damage_card
	
