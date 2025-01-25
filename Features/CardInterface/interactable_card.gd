class_name InteractableCard
extends Control

signal card_played

var _card : Card = null


#-------------------------------------------------------------------------------
func setup(card : Card) -> void:
	_card = card


#-------------------------------------------------------------------------------
func get_card() -> Card:
	return _card


#-------------------------------------------------------------------------------
func _on_mouse_entered() -> void:
	$TextureButton.position.y = -75


#-------------------------------------------------------------------------------
func _on_mouse_exited() -> void:
	$TextureButton.position.y = 0


#-------------------------------------------------------------------------------
func _on_pressed() -> void:
	card_played.emit()
	
	# TODO: Will need to validate that the card can be played before disabling it
	$TextureButton.disabled = true # Avoid the player clicking multiple times


#-------------------------------------------------------------------------------
