extends Node
class_name ExhaustionComponent

signal exhaustion_changed(new_health, max_health)

var max_exhaustion_amount: int = 100
var current_exhaustion_amount: int

func _ready():
	call_deferred("modify", max_exhaustion_amount)

func modify(amount: int):
	current_exhaustion_amount = clamp(current_exhaustion_amount + amount, 0, max_exhaustion_amount)
	print("Current Exhaustion:", current_exhaustion_amount)
	exhaustion_changed.emit(current_exhaustion_amount, max_exhaustion_amount)
	
func reset():
	current_exhaustion_amount = max_exhaustion_amount
