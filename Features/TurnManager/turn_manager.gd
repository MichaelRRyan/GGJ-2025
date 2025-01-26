extends Node

signal draw_cards
signal spirits_turn_started

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
			spirits_turn_started.emit()
	
	# Changes the state variable
	_turn_state = new_state


#-------------------------------------------------------------------------------
func _on_card_interface_turn_ended() -> void:
	var player = GameState.getEffectTarget(GameState.TargetName.PLAYER)
	var spirit = GameState.getEffectTarget(GameState.TargetName.SPIRIT)
	if player:
		var player_statuses = player.get_node("StatusesComponent")
		if player_statuses:
			player_statuses.decrement_statuses()
	if spirit:
		var spirit_statuses = spirit.get_node("StatusesComponent")
		if spirit_statuses:
			spirit_statuses.decrement_statuses()
	_change_state(TurnState.SPIRITS_TURN)


#-------------------------------------------------------------------------------
func _on_spirit_turn_finished() -> void:
	_change_state(TurnState.DRAW)



#-------------------------------------------------------------------------------
