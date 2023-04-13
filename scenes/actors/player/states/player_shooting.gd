class_name PlayerShooting
extends State

@onready var bullet_tracer = preload("res://scenes/actors/player/bullet/bullet_tracer.tscn")

## When this state is entered
func enter() -> void:
	actor.ammo -= 1
	print(actor.ammo)
	var bullet_direction = actor.get_local_mouse_position().normalized() * 1024
	var spread = randf_range(-0.0075, 0.0075)
	if state_machine.last_state != state_machine.states["Walking"] or state_machine.last_state != state_machine.states["Idle"]:
		bullet_direction = bullet_direction.rotated(spread)
	var hitscan = PhysicsRayQueryParameters2D.create(actor.position, actor.to_global(bullet_direction))
	hitscan.exclude = [self]
	var result = actor.space.intersect_ray(hitscan)
	
	var bullet = bullet_tracer.instantiate()
	get_parent().add_child(bullet) 
	bullet.origin = -actor.to_local(Vector2.ZERO)
	bullet.add_point(bullet.origin)
	if result:
		bullet.end = result.position
		if result.collider.has_method("is_hit"):
			result.collider.is_hit(1)
	else:
		bullet.end = actor.to_global(bullet_direction)
	bullet.new_end = bullet.origin
	bullet.add_point(bullet.new_end)

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
