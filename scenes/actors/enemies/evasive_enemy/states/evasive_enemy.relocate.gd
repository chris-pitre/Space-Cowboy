class_name EvasiveEnemyRelocate extends State

## When this state is entered
func enter() -> void:
	var r = 128 * sqrt(randf())
	var theta = randf() * 2 * PI
	var rand_point = Vector2(r * cos(theta), r * sin(theta))
	actor.go_to_target(actor.global_position + rand_point)
	await actor.target_reached
	state_machine.enter_state_by_name("Idle")

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	pass

func get_rand_point(rad_min: float, rad_max: float) -> void:
	pass
