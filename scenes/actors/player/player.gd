class_name Player
extends Actor

func _ready():
	Game.player = self

func get_movement_direction(delta) -> Vector2:
	return get_input_vector()
