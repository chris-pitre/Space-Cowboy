class_name Player extends Actor

func _ready():
	Game.player = self

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		state_machine.enter_state(state_machine.states["Jumping"])
	$Label.text = state_machine.current_state.name
	super._process(delta)

func get_movement_direction() -> Vector2:
	return get_input_vector()
