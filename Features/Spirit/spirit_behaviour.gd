extends Node2D

signal turn_finished

# Bad way to fetch a node but we're nearly out of time here.
@onready var _player_exhaustion = $"../Player/ExhaustionComponent"

@onready var _sprite : Sprite2D = $Sprite2D
@onready var _mud_sprite : Sprite2D = $MudSprite
@onready var _max_mud_sprite : Sprite2D = $MaxMudSprite

var _spirit_index = -1

var _sprites = [
	"res://Features/Spirit/Images/Characters/duck_spirit.png",
	"res://Features/Spirit/Images/Characters/hat_spirit.png",
	"res://Features/Spirit/Images/Characters/soot_spirit.png",
	[
		"res://Features/Spirit/Images/Characters/ghost_spirit.png",
		"res://Features/Spirit/Images/Characters/ghost_spirit_angry.png"
	]
]

var _sprite_dirt = [
	[ 
		"res://Features/Spirit/Images/Mud/duck_spirit_mud.png",
		"res://Features/Spirit/Images/Mud/duck_spirit_mud_max.png" 
	],
	[
		"res://Features/Spirit/Images/Mud/hat_spirit_mud.png",
		"res://Features/Spirit/Images/Mud/hat_spirit_mud_max.png"
	],
	[
		"res://Features/Spirit/Images/Mud/soot_spirit_mud.png",
		"res://Features/Spirit/Images/Mud/soot_spirit_mud_max.png"
	],
	[
		"res://Features/Spirit/Images/Mud/ghost_spirit_mud.png",
		"res://Features/Spirit/Images/Mud/ghost_spirit_angry_mud_max.png"
	]
]


enum TurnState {
	NONE = -1,
	THINKING = 0,
	TURN_MADE = 1,
}

var _turn_state := TurnState.NONE


func _ready() -> void:
	_spirit_index = randi_range(0, _sprites.size() - 1)
	
	if _spirit_index == 3:
		_sprite.texture = load(_sprites[_spirit_index][1])
		_max_mud_sprite.show()
		_mud_sprite.hide()
	else:
		_sprite.texture = load(_sprites[_spirit_index])
	
	_mud_sprite.texture = load(_sprite_dirt[_spirit_index][0])
	_max_mud_sprite.texture = load(_sprite_dirt[_spirit_index][1])


func _update_mud(current_health: int, max_health: int):
	var half_health = max_health / 2
	
	var progress_to_half : float = max(current_health - half_health, 0)
	_max_mud_sprite.modulate.a = progress_to_half / half_health
	
	if current_health < half_health:
		_mud_sprite.modulate.a = 1.0 * current_health / half_health
		
		if _spirit_index == 3:
			_sprite.texture = load(_sprites[_spirit_index][0])
			_max_mud_sprite.hide()
			_mud_sprite.show()


func take_turn():
	print("My turn")
	_turn_state = TurnState.THINKING
	$ActionLabel.text = "Thinking..."
	$ActionLabel.show()
	$TurnTimer.start()
	

func _on_turn_timer_timeout() -> void:
	match _turn_state:
		TurnState.THINKING:
			if randi_range(0, 1) == 0:
				$ActionLabel.text = "Did nothing!"
			else:
				$ActionLabel.text = "Splash!"
				_splash()
				
			_turn_state = TurnState.TURN_MADE
			$TurnTimer.start()
			
		TurnState.TURN_MADE:
			$ActionLabel.hide()
			print("Turn finished")
			turn_finished.emit()


func _on_turn_manager_spirits_turn_started() -> void:
	take_turn()


func _splash():
	_player_exhaustion.modify(-10)


func _on_health_component_health_changed(new_health: int, max_health: int) -> void:
	_update_mud(new_health, max_health)
