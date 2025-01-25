extends Node
class_name StatusesComponent

signal statuses_changed(new_health, max_health)

var current_statuses : Array = []

func reset():
	current_statuses = []
	
func applyStatus(status : Status):
	for current_status in current_statuses:
		if status != current_status:
			current_statuses.append(status)

func getStatus()
