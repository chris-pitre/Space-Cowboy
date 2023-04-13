class_name PlayerIdle
extends State

## When this state is entered
func enter() -> void:
	pass

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	if actor.get_input_vector().length() > 0:
		if Input.is_action_pressed("walk"):
			state_machine.next_state = state_machine.states["Walking"]
		else:
			state_machine.next_state = state_machine.states["Running"]
	if Input.is_action_just_pressed("attack") and actor.ammo > 0:
		state_machine.enter_state(state_machine.states["Shooting"])
	if Input.is_action_just_pressed("reload"):
		state_machine.enter_state(state_machine.states["Reloading"])

## When this state is exited
func exit() -> void:
	pass
