extends Node

var _draw_deck := Deck.new()
var _discard_deck := Deck.new()
var _hand_cards := []
var _max_hand_size : int = 5


func create_card(name: String, description: String, effect: Effect) -> Card:
	# Create the card with the name, description and assign the effect
	var card = Card.new()
	card.name = name
	card.description = description
	card.effect = effect

	return card


func _ready():
	var spirit = get_parent().get_node("Spirit")

	# Create a damage card that damage the Spirit
	var damage_effect = DamageEffect.new()
	damage_effect.target = spirit
	var damage_card_spirit = create_card("DamageCard", "Deal damage to the player.", damage_effect)

	_draw_deck.add_card(damage_card_spirit)
	_draw_deck.add_card(damage_card_spirit)
	_draw_deck.add_card(damage_card_spirit)
	_draw_deck.add_card(damage_card_spirit)
	_draw_deck.add_card(damage_card_spirit)


#-------------------------------------------------------------------------------
func draw_cards():
	_hand_cards.append_array(_draw_deck.draw(_max_hand_size))
	
	# If the deck runs out, reshuffle the discard pile and redraw
	if _hand_cards.size() < _max_hand_size:
		var discards : Array = _discard_deck.draw(1000) # Rediculously high number so all cards are drawn
		_draw_deck.add_cards(discards)
		_hand_cards.append_array(_draw_deck.draw(_max_hand_size - _hand_cards.size()))
	
	# Represent the cards in the UI.
	var card_interface : CardInterface = get_parent().get_node("CardInterface")
	card_interface.setup_cards(_hand_cards) # Need to move this 5 into a variable


#-------------------------------------------------------------------------------
func play_card(card : Card):
	card.play()
	_discard_deck.add_card(card)
	_hand_cards.erase(card) # Doesn't delete the card, just removes it from the hand.


#-------------------------------------------------------------------------------
func _on_card_interface_turn_ended() -> void:
	_discard_deck.add_cards(_hand_cards)
	_hand_cards.clear()


#-------------------------------------------------------------------------------
