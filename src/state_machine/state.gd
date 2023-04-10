class_name State
extends Node

## The Actor that this state controls.
@export var actor: Actor
## The state machine that this state belongs to.
@export var state_machine: StateMachine

## When this state is entered
func enter() -> void:
	pass

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	pass
