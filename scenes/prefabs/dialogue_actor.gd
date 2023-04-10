class_name DialogueActor
extends ProximityInteractable

@export_category("Dialogue")
@export var dialogue: Array[DialogueBranch]

var interacting = false

## Function that is called when player interacts with the DialogueActor.
func interact() -> void:
	if not interacting:
		enter_dialogue(dialogue)

func enter_dialogue(dialogue: Array[DialogueBranch]) -> void:
	Game.user_interface.start_dialogue(dialogue, self)
	interacting = true

func exit_dialogue() -> void:
	await get_tree().create_timer(0.5).timeout # Debounce to avoid reentering dialogue immediately
	interacting = false
