extends Node2D

signal turn_finished


func take_turn():
	print("My turn")
	$TurnTimer.start()
	

func _on_turn_timer_timeout() -> void:
	print("Turn finished")
	
	turn_finished.emit()


func _on_turn_manager_spirits_turn_started() -> void:
	take_turn()
