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
		state_machine.next_state = state_machine.states["Walking"]

## When this state is exited
func exit() -> void:
	pass
