class_name PlayerAttacking
extends State

## When this state is entered
func enter() -> void:
	actor.speed /= 2

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	actor.speed *= 2
