extends Control

func _on_health_component_health_changed(new_health: Variant, max_health: Variant) -> void:
	if new_health ==0 :
		get_tree().change_scene_to_file("res://Gameplay/next_screen.tscn")
