class_name EvasiveEnemyAttacking extends State

## When this state is entered
func enter() -> void:
	await get_tree().create_timer(1).timeout
	state_machine.enter_state_by_name("Relocate")

## Run every frame
func run(delta: float) -> void:
	pass

## Run every physics frame
func run_physics(delta: float) -> void:
	pass

## When this state is exited
func exit() -> void:
	pass
