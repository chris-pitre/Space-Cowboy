class_name StateMachine
extends Node

var last_state: State
var current_state: State
var next_state: State

func _process(delta):
	current_state.run(delta)
	if next_state:
		enter_state(next_state)

## Handles state transitions
func enter_state(next_state: State) -> void:
	last_state = current_state
	current_state.exit()
	next_state.enter()
	current_state = next_state
