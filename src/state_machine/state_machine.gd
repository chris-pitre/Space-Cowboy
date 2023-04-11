class_name StateMachine
extends Node

## The state that this state machine is in once it is ready.
@export var default_state: State

var states = {}
var last_state: State
var current_state: State
var next_state: State

func _ready() -> void:
	get_states()
	current_state = default_state

func _process(delta) -> void:
	current_state.run(delta)

func _physics_process(delta) -> void:
	current_state.run_physics(delta)
	if next_state:
		enter_state(next_state)
		next_state = null

func get_states() -> void:
	for state in get_children():
		states[state.name] = state

## Handles state transitions
func enter_state(enter_state: State) -> void:
	if enter_state != current_state:
		last_state = current_state
		current_state.exit()
		enter_state.enter()
		current_state = enter_state
