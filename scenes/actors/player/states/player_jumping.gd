class_name PlayerJumping
extends State

## When this state is entered
func enter() -> void:
	actor.grounded = false
	actor.y_velocity = 128

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	if actor.grounded:
		state_machine.next_state = state_machine.last_state

## When this state is exited
func exit() -> void:
	pass
