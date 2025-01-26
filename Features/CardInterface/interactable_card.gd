class_name InteractableCard
extends Control

signal card_played

var _card : Card = null


#-------------------------------------------------------------------------------
func setup(card : Card) -> void:
	_card = card
	
	$TextureButton/CardIcon.texture = load(card.texture_path)
	var exhaustion_cost = card.get_card_exhaustion_cost()
	if exhaustion_cost > 0:
		$TextureButton/ExhaustionLabel.text = str(exhaustion_cost)
	else:
		get_node("TextureButton/ExhaustionIcon").queue_free()
		get_node("TextureButton/ExhaustionLabel").queue_free()

	$TextureButton/ActionPointsLabel.text = str(card.get_card_action_cost())
	$TextureButton/CardName.text = card.name
	$TextureButton/CardDescription.text = card.description


#-------------------------------------------------------------------------------
func get_card() -> Card:
	return _card


#-------------------------------------------------------------------------------
func _on_mouse_entered() -> void:
	$TextureButton.position.y = -95


#-------------------------------------------------------------------------------
func _on_mouse_exited() -> void:
	$TextureButton.position.y = 0


#-------------------------------------------------------------------------------
func _on_pressed() -> void:
	card_played.emit()
	
	# TODO: Will need to validate that the card can be played before disabling it
	$TextureButton.disabled = true # Avoid the player clicking multiple times


#-------------------------------------------------------------------------------
