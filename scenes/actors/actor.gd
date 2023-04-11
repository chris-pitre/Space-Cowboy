class_name Actor extends CharacterBody2D

@export_category("Actor Settings")
@export var speed: float = 128.0
@export var cast_shadow: bool = true
@export var shadow_size: int = 8
@export var sprite: Node2D

@export_category("Navigation")
@export var pathfind_movement: bool = false
@export var nav_agent: NavigationAgent2D

@export var state_machine: StateMachine

var movement_locked: bool = false
var nav_target: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO

var gravity = 256
var y_velocity: float = 0.0
var grounded: bool = true
var height: float = 0.0

func _process(delta) -> void:
	sprite.position.y = -(height + 8)

func _physics_process(delta) -> void:
	direction = Vector2.ZERO
	# Vertical physics
	if not grounded:
		y_velocity -= gravity * delta
		height += y_velocity * delta
		if height < 0:
			height = 0
			grounded = true
	
	# Need to refactor this pathfinding logic; probably will do when making first enemy
	if pathfind_movement:
		if nav_agent:
			direction = nav_agent.get_next_path_position().normalized()
		else:
			push_error("Pathfinding is enabled for an actor, but no nav_agent was found.")
	else:
		direction = get_movement_direction(delta).normalized()
	if not movement_locked:
		velocity = direction * speed

	move_and_slide()

## Controls the direction that the actor wants to move in.
func get_movement_direction(delta) -> Vector2:
	push_error("Actor doesn't implement <get_movement_direction> function.")
	return Vector2()

## Returns the Vector2 direction of movement inputs.
func get_input_vector() -> Vector2:
	return Vector2(Input.get_axis("move_left", "move_right"),
			Input.get_axis("move_up", "move_down"))
