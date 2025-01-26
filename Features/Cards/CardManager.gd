extends Node

var _draw_deck : Deck = null
var _discard_deck := Deck.new()
var _hand_cards := []
var _max_hand_size : int = 5


#-------------------------------------------------------------------------------
func _ready() -> void:
	_draw_deck = PersistentDeck
	_draw_deck.shuffle()


#-------------------------------------------------------------------------------
func draw_cards():
	_hand_cards.append_array(_draw_deck.draw(_max_hand_size))
	
	# If the deck runs out, reshuffle the discard pile and redraw
	if _hand_cards.size() < _max_hand_size:
		var discards : Array = _discard_deck.draw(1000) # Rediculously high number so all cards are drawn
		_draw_deck.add_cards(discards)
		_draw_deck.shuffle()
		_hand_cards.append_array(_draw_deck.draw(_max_hand_size - _hand_cards.size()))
	
	# Represent the cards in the UI.
	var card_interface : CardInterface = get_parent().get_node("CardInterface")
	card_interface.setup_cards(_hand_cards) # Need to move this 5 into a variable


#-------------------------------------------------------------------------------
func play_card(card : Card):
	# Check if we can play here

	card.play()
	_discard_deck.add_card(card)
	_hand_cards.erase(card) # Doesn't delete the card, just removes it from the hand.


#-------------------------------------------------------------------------------
func _on_card_interface_turn_ended() -> void:
	var action_point_component : ActionPointsComponent = GameState.playerEntity.get_node("ActionPointsComponent")
	action_point_component.reset()
	
	_discard_deck.add_cards(_hand_cards)
	_hand_cards.clear()


#-------------------------------------------------------------------------------
func return_all_to_deck():
	_discard_deck.add_cards(_hand_cards)
	_hand_cards.clear()
	_draw_deck.add_cards(_discard_deck.draw(1000))


#-------------------------------------------------------------------------------
func _on_scene_change_scene_changing() -> void:
	return_all_to_deck()


#-------------------------------------------------------------------------------
