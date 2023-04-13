class_name PlayerAbility
extends State

## When this state is entered
func enter() -> void:
	actor.ability_manager.do_ability()
	state_machine.next_state = state_machine.last_state

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	pass
