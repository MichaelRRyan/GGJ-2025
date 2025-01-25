extends Node

const CardFactory = preload("res://Features/Cards/CardFactory.gd")
const EncounterScene = preload("res://Features/Encounter/encounter.tscn")

var encounter_scene : Encounter = null

func _ready() -> void:
	initialise_deck()
	start_encounter()

func initialise_deck():
	var spirit_name = "Spirit"

	# Add multiple cards to PersistentDeck
	for i in range(5):
		PersistentDeck.add_card(CardFactory.get_damage_card(spirit_name))

func start_encounter():
	encounter_scene = EncounterScene.instantiate()
	add_child(encounter_scene)
	encounter_scene.encounter_finished.connect(_on_encounter_finished)
	
	print("Starting encounter...")

func _on_encounter_finished():
	encounter_scene.queue_free()
	encounter_scene = null
	print("Encounter has finished.")
	
