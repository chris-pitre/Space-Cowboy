class_name Actor
extends CharacterBody2D

@export var pathfind_movement: bool = false

const SPEED = 256.0

var movement_locked: bool = false

var direction = Vector2()

func _physics_process(delta) -> void:
	direction = Vector2.ZERO
	var direction = get_movement_direction(delta).normalized()
	if not movement_locked:
		velocity = direction * SPEED

	move_and_slide()

## Controls the direction that the actor wants to move in.
func get_movement_direction(delta) -> Vector2:
	push_error("Actor doesn't implement <get_movement_direction()> function.")
	return Vector2()
