class_name Player extends Actor

@export_category("Player Settings")
@export var ammo: int = 6

var space: PhysicsDirectSpaceState2D

func _ready():
	Game.player = self

func _physics_process(delta):
	space = get_world_2d().direct_space_state
	super._physics_process(delta)
	

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		state_machine.enter_state(state_machine.states["Jumping"])
	super._process(delta)

func get_movement_direction() -> Vector2:
	return get_input_vector()
