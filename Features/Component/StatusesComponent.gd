extends Node
class_name StatusesComponent

signal status_applied(status_name)
signal status_removed(status_name)
signal statuses_changed(statuses)

var statuses: Dictionary = {} # Status : Duration

func apply_status(status_name: String, duration: int):
	statuses[status_name] = duration
	emit_signal("status_applied", status_name)
	emit_signal("statuses_changed", statuses)

func remove_status(status_name: String):
	if status_name in statuses:
		statuses.erase(status_name)
		emit_signal("status_removed", status_name)
		emit_signal("statuses_changed", statuses)

func has_status(status_name: String) -> bool:
	return status_name in statuses

func modify_damage(type_of_effect: Object,  base_damage: int) -> int:
	var modified_damage = base_damage
	
	if "Shampooed" in statuses && type_of_effect is WashdownEffect:
		modified_damage *= 2
		remove_status("Shampooed")
	if "Soaped" in statuses  && type_of_effect is ScrubEffect:
		modified_damage *= 2
		remove_status("Soaped")
	return modified_damage

func decrement_statuses():
	var to_remove = []
	for status_name in statuses.keys():
		statuses[status_name] -= 1
		if statuses[status_name] <= 0:
			to_remove.append(status_name)
	for status_name in to_remove:
		remove_status(status_name)
