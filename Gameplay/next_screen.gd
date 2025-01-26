extends Control

func _on_cards_pressed() -> void:
	get_tree().change_scene_to_file("res://Gameplay/card_select_screen.tscn")


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Features/Encounter/encounter.tscn")
