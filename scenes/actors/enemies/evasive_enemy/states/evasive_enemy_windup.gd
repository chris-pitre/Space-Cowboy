class_name EvasiveEnemyWindUp extends State

## When this state is entered
func enter() -> void:
	actor.modulate = Color.RED
	await get_tree().create_timer(1).timeout
	actor.modulate = Color.GREEN
	actor.vulnerable = true
	await get_tree().create_timer(0.5).timeout
	state_machine.enter_state_by_name("Attacking")

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	actor.modulate = Color.WHITE
