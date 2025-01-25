extends Node

static var playerEntity : Object
static var spiritEntity : Object

enum TargetName {
	PLAYER = 1,
	SPIRIT = 2
}



func getEffectTarget(target_name : TargetName) -> Object:
	
	match target_name:
		TargetName.PLAYER:
			return playerEntity
		TargetName.SPIRIT:
			return spiritEntity
	return null
