class_name DummyShooting
extends State

@onready var bullet_path = preload("res://scenes/actors/dummy/bullet/dummy_bullet.tscn")

## When this state is entered
func enter() -> void:
	var bullet = bullet_path.instantiate()
	actor.add_child(bullet)
	bullet.direction = actor.global_position.direction_to(Game.player.global_position+Game.player.velocity)

## Run every frame
func run(delta: float) -> void:
	await get_tree().create_timer(actor.time_between_shots).timeout
	state_machine.next_state = state_machine.states["Idle"]

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	pass
