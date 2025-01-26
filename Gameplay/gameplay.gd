extends Node

const CardFactory = preload("res://Features/Cards/CardFactory.gd")
const EncounterScene = preload("res://Features/Encounter/encounter.tscn")

var encounter_scene : Encounter = null

func _ready() -> void:
	initialise_deck()
	start_encounter()

func initialise_deck():
	# Add cards to the persistent deck
	
	PersistentDeck.add_card(CardFactory.get_scrub_spirit_card())
	PersistentDeck.add_card(CardFactory.get_wash_down_spirit_card())
	PersistentDeck.add_card(CardFactory.get_scrub_spirit_card())
	PersistentDeck.add_card(CardFactory.get_wash_down_spirit_card())
	PersistentDeck.add_card(CardFactory.get_soap_card())
	PersistentDeck.add_card(CardFactory.get_conditioner_card())
	PersistentDeck.add_card(CardFactory.get_coffee_card())
	PersistentDeck.add_card(CardFactory.get_shampoo_card())

func start_encounter():
	encounter_scene = EncounterScene.instantiate()
	add_child(encounter_scene)
	encounter_scene.encounter_finished.connect(_on_encounter_finished)
	
	print("Starting encounter...")

func _on_encounter_finished():
	encounter_scene.queue_free()
	encounter_scene = null
	print("Encounter has finished.")
	
