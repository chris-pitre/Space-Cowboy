class_name StateMachine
extends Node

## The state that this state machine is in once it is ready.
@export var default_state: State
## The actor that this state machine controls.
@export var actor: Actor

var states = {}
var last_state: State
var current_state: State
var next_state: State

func _ready() -> void:
	get_states()
	enter_state(default_state)

func _process(delta) -> void:
	if current_state:
		current_state.run(delta)

func _physics_process(delta) -> void:
	if current_state:
		current_state.run_physics(delta)
	if next_state:
		enter_state(next_state)
		next_state = null

func get_states() -> void:
	for state in get_children():
		states[state.name] = state
		state.state_machine = self
		state.actor = actor

## Handles state transitions
func enter_state(enter_state: State) -> void:
	if enter_state != current_state:
		if current_state:
			current_state.exit()
		last_state = current_state
		enter_state.enter()
		current_state = enter_state

func enter_state_by_name(state_name: String) -> void:
	enter_state(states[state_name])
