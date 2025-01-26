extends ProgressBar


func _on_action_points_component_action_points_changed(new_action_points: Variant, max_action_points: Variant) -> void:
	max_value = max_action_points
	value = new_action_points


func _on_exhaustion_component_exhaustion_changed(new_exhaustion: Variant, max_exhaustion_amount: Variant) -> void:
	max_value = max_exhaustion_amount
	value = new_exhaustion


func _on_health_component_health_changed(new_health: Variant, max_health: Variant) -> void:
	max_value = max_health
	value = new_health
