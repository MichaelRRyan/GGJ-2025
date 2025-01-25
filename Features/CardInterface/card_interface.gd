class_name CardInterface
extends CanvasLayer

signal turn_ended
signal card_played(card : Card)

# _ = private
# s = preloaded Scene
# n = referenced Node

# This will be a wrapper class that holds a card and provides hover / click functionality
@onready var _s_InteractableCard = preload("res://Features/CardInterface/interactable_card.tscn")
@onready var _n_hand = $CardTray/Hand


#-------------------------------------------------------------------------------
# TODO Move this to card manager
func shuffle() -> void:
	pass


#-------------------------------------------------------------------------------
func setup_cards(cards : Array) -> void:
	_discard_all()
	
	for card in cards:
		var interactable : InteractableCard = _s_InteractableCard.instantiate()
		_n_hand.add_child(interactable)
		
		interactable.setup(card)
		interactable.connect("card_played", _on_card_played.bind(interactable))


#-------------------------------------------------------------------------------
func _end_turn() -> void:
	_discard_all()
	turn_ended.emit()


#-------------------------------------------------------------------------------
func _on_card_played(interactable_card : InteractableCard) -> void:
	# TODO: Need to validate if the card can be played.
	if is_instance_valid(interactable_card):
		var card = interactable_card.get_card()
		var action_point_component : ActionPointsComponent = GameState.playerEntity.get_node("ActionPointsComponent")
		if action_point_component.current_action_points >= card.get_card_action_cost():
			card_played.emit(card)
			interactable_card.queue_free()
		else:
			print("Insufficient Action Points")


#-------------------------------------------------------------------------------
func _discard_all():
	var cards = _n_hand.get_children()
	
	for card in cards:
		card.queue_free() # Deletes the card UI node
