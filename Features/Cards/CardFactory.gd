static func create_card(name: String, description: String, effects: Array) -> Card:
	# Create the card with the name, description and assign the effect
	var card = Card.new()
	card.name = name
	card.description = description
	for effect in effects:
		card.effects.append(effect)

	return card
	

static func get_damage_spirit_card() -> Card:
	var damage_effect = DamageEffect.new()
	var action_points_effect = ActionPointEffect.new()
	damage_effect.target_name = GameState.TargetName.SPIRIT
	action_points_effect.target_name = GameState.TargetName.PLAYER
	var effects = [damage_effect, action_points_effect]
	var damage_card = create_card("DamageCard", "Deal damage to the player.", effects)
	return damage_card
