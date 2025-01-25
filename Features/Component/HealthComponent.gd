extends Node
class_name HealthComponent

signal action_points_changed(new_health, max_health)

var max_health: int = 100
var current_health: int

func _ready():
	call_deferred("modify", max_health)

func modify(amount: int):
	current_health = clamp(current_health + amount, 0, max_health)
	print("Health:", current_health)
	action_points_changed.emit(current_health, max_health)
