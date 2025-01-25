extends Node
class_name Deck

var _cards: Array = []

func add_card(card: Card):
	_cards.append(card)


func add_cards(cards : Array) -> void:
	_cards.append_array(cards)


func draw(num_cards : int) -> Array:
	var draw_cards = []
	
	for _i in num_cards:
		if not _cards.is_empty():
			draw_cards.append(_cards.pop_front())
		else:
			print("Deck is empty!")
			break
	
	return draw_cards

		
func shuffle() -> void:
	# Shuffle the array
	_cards.shuffle()
