class_name PlayerShooting
extends State

@onready var bullet_tracer = preload("res://scenes/actors/player/bullet/bullet_tracer.tscn")

## When this state is entered
func enter() -> void:
	var mouse_pos = actor.get_local_mouse_position().normalized() * 4096
	var hitscan = PhysicsRayQueryParameters2D.create(actor.position, actor.to_global(mouse_pos))
	hitscan.exclude = [self]
	var result = actor.space.intersect_ray(hitscan)
	
	var bullet = bullet_tracer.instantiate()
	get_parent().add_child(bullet)
	if result:
		bullet.animate(-actor.to_local(Vector2.ZERO), result.position)
		if result.collider.has_method("is_hit"):
			result.collider.is_hit(1)
	else:
		bullet.animate(-actor.to_local(Vector2.ZERO), mouse_pos)

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
