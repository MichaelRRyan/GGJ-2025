extends CanvasLayer

signal turn_ended

# _ = private
# s = preloaded Scene
# n = referenced Node

@onready var _s_PlaceholderCard = preload("res://Features/CardInterface/placeholder_card.tscn")
@onready var _n_hand = $CardTray/Hand

#-------------------------------------------------------------------------------
func shuffle() -> void:
	pass


#-------------------------------------------------------------------------------
func draw_cards() -> void:
	var no_cards_to_draw = 5 # We want this info to be coming from somewhere else later
	
	for _i in no_cards_to_draw:
		# We will want to replace this with a wrapper class that holds a card
		# The wrapper class will provide the mouse over / click functionality
		var card : Control = _s_PlaceholderCard.instantiate()
		_n_hand.add_child(card)
		
		card.modulate.r = randf_range(0, 1) # TEMP: Change card colour so we can tell when we draw new cards


#-------------------------------------------------------------------------------
func _end_turn() -> void:
	var cards = _n_hand.get_children()
	
	# We can delete while looping in the array because queue_free queues the
	# delete operation until a later frame
	for card in cards:
		card.queue_free() # Deletes the card node
		# Later we will need to add the card data to the discard pile, but this
		# will happen in another script.
	
	turn_ended.emit()


#-------------------------------------------------------------------------------
