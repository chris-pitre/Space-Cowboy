class_name DummyIdle
extends State

## When this state is entered
func enter() -> void:
	pass

## Run every frame
func run(delta: float) -> void:
	await get_tree().create_timer(actor.time_between_shots).timeout
	state_machine.next_state = state_machine.states["Shooting"]

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	pass
