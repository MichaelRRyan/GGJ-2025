extends Node
class_name ActionPointsComponent

signal action_points_changed(new_health, max_health)

var max_action_points: int = 3
var current_action_points: int

func _ready():
	call_deferred("modify", max_action_points)

func modify(amount: int):
	current_action_points = clamp(current_action_points + amount, 0, max_action_points)
	print("Current Action Points:", current_action_points)
	action_points_changed.emit(current_action_points, max_action_points)
	
func reset():
	call_deferred("modify", max_action_points)
