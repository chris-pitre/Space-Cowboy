class_name Actor extends CharacterBody2D

signal target_reached

const GRAVITY = 256

@export_category("Node Settings")
@export var sprite: Node2D
@export var nav_agent: NavigationAgent2D
@export var state_machine: StateMachine

@export_category("Actor Settings")
@export var speed: float = 128.0
@export var shadow_size: int = 8
@export var shadow_num_points: int = 8
@export var cast_shadow: bool = true

var navigating: bool = false
var movement_locked: bool = false
var direction: Vector2 = Vector2.ZERO

var y_velocity: float = 0.0
var grounded: bool = true
var height: float = 0.0

func _ready() -> void:
	pass

func _process(delta) -> void:
	sprite.position.y = -(height + 8)

func _physics_process(delta) -> void:
	direction = Vector2.ZERO
	do_physics(delta)
	if navigating:
		if nav_agent.is_navigation_finished():
			end_navigation()
		direction = (nav_agent.get_next_path_position() - global_position).normalized()
	else:
		direction = get_movement_direction().normalized()
	if not movement_locked:
		velocity = direction * speed
	move_and_slide()

## Controls the direction that the actor wants to move in.
func get_movement_direction() -> Vector2:
	push_error("Actor doesn't implement <get_movement_direction> function.")
	return Vector2()

## Returns the Vector2 direction of movement inputs.
func get_input_vector() -> Vector2:
	return Vector2(Input.get_axis("move_left", "move_right"),
			Input.get_axis("move_up", "move_down"))

func is_point_reachable(pos: Vector2) -> void:
	nav_agent.target_position = pos
	return nav_agent.is_target_reachable()

## Automatically moves an actor to the nav_target
func go_to_target(pos: Vector2) -> void:
	if nav_agent:
		nav_agent.target_position = pos
		if nav_agent.is_target_reachable():
			navigating = true
		else:
			push_error("Navigation target unreachable.")
	else:
		push_error("Actor tried to use pathfinding but did not have a NavigationAgent2D.")

func end_navigation() -> void:
	emit_signal("target_reached")
	navigating = false

## Handles vertical physics
func do_physics(delta) -> void:
	if not grounded:
		y_velocity -= GRAVITY * delta
		height += y_velocity * delta
		if height < 0:
			height = 0
			grounded = true
