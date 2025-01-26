extends Node
class_name StatusesComponent

signal status_applied(status_name)
signal status_removed(status_name)
signal statuses_changed(statuses)

var statuses: Dictionary = {} # Status : Modifier

func apply_status(status_name: String, modifier: int):
	statuses[status_name] = modifier
	emit_signal("status_applied", status_name)
	emit_signal("statuses_changed", statuses)

func remove_status(status_name: String):
	if status_name in statuses:
		statuses.erase(status_name)
		emit_signal("status_removed", status_name)
		emit_signal("statuses_changed", statuses)

func has_status(status_name: String) -> bool:
	return status_name in statuses

func modify_damage(type_of_effect: String,  base_damage: int) -> int:
	var modified_damage = base_damage
	
	if "Shampooed" in statuses && type_of_effect == "WashdownEffect":
		modified_damage *= statuses["Shampooed"]
		remove_status("Shampooed")
		apply_status("Shampooed + Washed", 5)
		return modified_damage
	if "Soaped" in statuses  && type_of_effect == "ScrubEffect":
		modified_damage *= statuses["Soaped"]
		remove_status("Soaped")
		return modified_damage
	if "Shampooed + Washed" in statuses && type_of_effect == "ConditionerEffect":
		modified_damage *= statuses["Shampooed + Washed"]
		remove_status("Shampooed + Washed")
		return modified_damage
		
	return modified_damage

func decrement_statuses():
	var to_remove = []
	for status_name in statuses.keys():
		statuses[status_name] -= 1
		if statuses[status_name] <= 0:
			to_remove.append(status_name)
	for status_name in to_remove:
		remove_status(status_name)
