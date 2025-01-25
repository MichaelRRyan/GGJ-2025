# Encounter.gd
class_name Encounter
extends Node

signal encounter_finished

func _ready() -> void:
	GameState.playerEntity = get_node("Player")
	GameState.spiritEntity = get_node("Spirit")
	print("Encounter started.")

func end_encounter():
	print("Encounter ended.")
	# Emit a signal to notify Gameplay to end the encounter
	encounter_finished.emit()
	queue_free()  # Clean up self, if not managed by SceneManager
