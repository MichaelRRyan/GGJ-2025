extends Node

func create_card(name: String, description: String, effect: Effect) -> Card:
	# Create the card with the name, description and assign the effect
	var card = Card.new()
	card.name = name
	card.description = description
	card.effect = effect

	return card


func _ready():
	var deck = Deck.new()

	var player = get_parent().get_node("Player")
	var spirit = get_parent().get_node("Spirit")

	# Create a damage card that damage the Spirit
	var damage_effect = DamageEffect.new()
	damage_effect.target = spirit
	var damage_card_spirit = create_card("DamageCard", "Deal damage to the player.", damage_effect)

	deck.add_card(damage_card_spirit)

	var card = deck.draw()
	if card:
		card.play()
