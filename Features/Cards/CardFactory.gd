static func create_card(name: String, description: String, texture_path : String, effects: Array) -> Card:
	# Create the card with the name, description and assign the effect
	var card = Card.new()
	card.name = name
	card.description = description
	card.texture_path = texture_path
	for effect in effects:
		card.effects.append(effect)

	return card
	

static func get_scrub_spirit_card() -> Card:
	var scrub_effect = ScrubEffect.new()
	scrub_effect.target_name = GameState.TargetName.SPIRIT
	scrub_effect.base_damage = 4
	
	var action_points_effect = ActionPointEffect.new()
	action_points_effect.target_name = GameState.TargetName.PLAYER
	
	var exhaustion_effect = ExhaustionEffect.new()
	exhaustion_effect.target_name = GameState.TargetName.PLAYER
	exhaustion_effect.exhaustion_cost = 3
	
	
	var effects = [scrub_effect, action_points_effect, exhaustion_effect]
	
	var texture_path = "res://Features/Cards/scrub.png"
	
	var damage_card = create_card("Scrub", "Scrub the spirit for " + str(scrub_effect.base_damage) + " cleanliness. If Soaped, deal 12", texture_path, effects)
	return damage_card
	
static func get_wash_down_spirit_card() -> Card:
	var wash_down_effect = WashdownEffect.new()
	wash_down_effect.target_name = GameState.TargetName.SPIRIT
	wash_down_effect.base_damage = 3
	
	var action_points_effect = ActionPointEffect.new()
	action_points_effect.target_name = GameState.TargetName.PLAYER
	
	var exhaustion_effect = ExhaustionEffect.new()
	exhaustion_effect.target_name = GameState.TargetName.PLAYER
	exhaustion_effect.exhaustion_cost = 1
	
	var texture_path = "res://Features/Cards/washdown.png"
	
	var effects = [wash_down_effect, action_points_effect, exhaustion_effect]
	
	var damage_card = create_card("Washdown", "Washdown the target for " + str(wash_down_effect.base_damage) + " cleanliness. If Shampooed, deal 9.", texture_path, effects)
	return damage_card
	
	
static func get_coffee_card() -> Card:
	var coffee_effect = CoffeeEffect.new()
	coffee_effect.target_name = GameState.TargetName.PLAYER
	coffee_effect.exhaustion_released = 4
	
	var action_points_effect = ActionPointEffect.new()
	action_points_effect.target_name = GameState.TargetName.PLAYER
	
	var exhaustion_effect = ExhaustionEffect.new()
	exhaustion_effect.target_name = GameState.TargetName.PLAYER
	exhaustion_effect.exhaustion_cost = 0
	
	var texture_path = "res://Features/Cards/coffee.png"
	
	var effects = [coffee_effect, action_points_effect, exhaustion_effect]
	
	var damage_card = create_card("Coffee", "Release " + str(coffee_effect.exhaustion_released) + " Exhaustion.", texture_path, effects)
	return damage_card
	
static func get_soap_card() -> Card:
	var soap_effect = SoapEffect.new()
	soap_effect.target_name = GameState.TargetName.SPIRIT
	
	var action_points_effect = ActionPointEffect.new()
	action_points_effect.target_name = GameState.TargetName.PLAYER
	
	var exhaustion_effect = ExhaustionEffect.new()
	exhaustion_effect.target_name = GameState.TargetName.PLAYER
	exhaustion_effect.exhaustion_cost = 3
	
	var texture_path = "res://Features/Cards/soap.png"
	
	var effects = [soap_effect, action_points_effect, exhaustion_effect]
	
	var damage_card = create_card("Soap", "Soaps up the target.", texture_path, effects)
	return damage_card
	
static func get_shampoo_card() -> Card:
	var shampoo_effect = ShampooEffect.new()
	shampoo_effect.target_name = GameState.TargetName.SPIRIT
	
	var action_points_effect = ActionPointEffect.new()
	action_points_effect.target_name = GameState.TargetName.PLAYER
	
	var exhaustion_effect = ExhaustionEffect.new()
	exhaustion_effect.target_name = GameState.TargetName.PLAYER
	exhaustion_effect.exhaustion_cost = 2
	
	var effects = [shampoo_effect, action_points_effect, exhaustion_effect]
	
	var texture_path = "res://Features/Cards/shampoo.png"
	
	var damage_card = create_card("Shampoo", "Shampoos the target.", texture_path, effects)
	return damage_card
	
static func get_conditioner_card() -> Card:
	var conditioner_effect = ConditionerEffect.new()
	conditioner_effect.target_name = GameState.TargetName.SPIRIT
	conditioner_effect.base_damage = 3
	
	var action_points_effect = ActionPointEffect.new()
	action_points_effect.target_name = GameState.TargetName.PLAYER
	
	var exhaustion_effect = ExhaustionEffect.new()
	exhaustion_effect.target_name = GameState.TargetName.PLAYER
	exhaustion_effect.exhaustion_cost = 5
	
	var texture_path = "res://Features/Cards/conditioner.png"
	
	var effects = [conditioner_effect, action_points_effect, exhaustion_effect]
	
	var damage_card = create_card("Conditioner", "Applies Conditioner for " + str(conditioner_effect.base_damage) + " cleanliness. If Shampooed and Washed, deal 15", texture_path, effects)
	return damage_card
