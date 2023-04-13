class_name PlayerReloading
extends State

var interrupt_reload: bool = false

## When this state is entered
func enter() -> void:
	interrupt_reload = false
	actor.speed /= 3
	while !interrupt_reload and actor.ammo < 6:
		await get_tree().create_timer(0.5).timeout
		actor.ammo += 1
		print(actor.ammo)
	state_machine.enter_state(state_machine.states["Idle"])

## Run every frame
func run(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		interrupt_reload = true

## Run every physics frame
func run_physics(delta: float) -> void:
	actor.get_movement_direction()

## When this state is exited
func exit() -> void:
	actor.speed *= 3
