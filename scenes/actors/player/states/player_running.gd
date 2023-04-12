class_name PlayerRunning
extends State

## When this state is entered
func enter() -> void:
	pass

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	actor.get_movement_direction()
	if Input.is_action_just_pressed("walk"):
		state_machine.enter_state_by_name("Walking")
	if actor.get_input_vector().length() == 0:
		state_machine.enter_state_by_name("Idle")

## When this state is exited
func exit() -> void:
	pass
