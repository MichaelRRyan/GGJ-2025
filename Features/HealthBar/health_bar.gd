extends ProgressBar


func _on_health_component_health_changed(new_health, max_health: Variant) -> void:
	max_value = max_health
	value = new_health
