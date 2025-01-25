extends Node
class_name Deck

var cards: Array = []

func add_card(card: Card):
	cards.append(card)

func draw() -> Card:
	if cards.size() > 0:
		return cards.pop_front()
	else:
		print("Deck is empty!")
		return null
		
func shuffle() -> void:
	# Shuffle the array
	cards.shuffle()
