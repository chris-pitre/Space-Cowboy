class_name EvasiveEnemy extends Enemy

func _ready():
	pass

func _process(delta):
	$Label.text = state_machine.current_state.name
	super._process(delta)

func get_movement_direction() -> Vector2:
	return Vector2.ZERO
