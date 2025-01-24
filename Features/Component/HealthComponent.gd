extends Node
class_name HealthComponent

var max_health: int = 100
var current_health: int

func _ready():
	current_health = max_health

func modify(amount: int):
	current_health = clamp(current_health + amount, 0, max_health)
	print("Health:", current_health)
