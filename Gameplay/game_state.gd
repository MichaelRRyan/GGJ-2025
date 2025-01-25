extends Node

static var playerEntity : Object
static var spiritEntity : Object


func getEffectTarget(target_name : String) -> Object:
	if(target_name == "Player"):
		return playerEntity
	if(target_name == "Spirit"):
		return spiritEntity
		
	return null
