extends Node

signal draw_cards

enum TurnState {
	NONE = -1,
	SHUFFLE = 0,
	DRAW = 1,
	STANDBY = 2,
	PLAY_CARD = 3,
	END_TURN = 4,
	SPIRITS_TURN = 5,
}

var _turn_state = TurnState.NONE


#-------------------------------------------------------------------------------
func _ready() -> void:
	# Need to defer this call to next frame so the UI has time to load the card asset.
	call_deferred("_change_state", TurnState.SHUFFLE) # DO we call this here?


#-------------------------------------------------------------------------------
func _change_state(new_state : TurnState) -> void:
	
	# Handles the state change (will implement more here later)
	match new_state:
		TurnState.SHUFFLE:
			print("TurnState: Shuffle")
			PersistentDeck.shuffle()
			_change_state(TurnState.DRAW) # Later we will want a delay
		TurnState.DRAW:
			print("TurnState: Draw")
			draw_cards.emit()
			_change_state(TurnState.STANDBY) # Later we will want a delay
		TurnState.SPIRITS_TURN:
			print("TurnState: Spirits Turn")
			_change_state(TurnState.DRAW) # Later we will want logic here
	
	# Changes the state variable
	_turn_state = new_state


#-------------------------------------------------------------------------------
func _on_card_interface_turn_ended() -> void:
	_change_state(TurnState.SPIRITS_TURN)
