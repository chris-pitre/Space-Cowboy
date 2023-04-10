class_name DialogueBranch
extends Resource

## The name for the speaker.
@export var speaker_name: String = "Name"
## The message for this dialogue branch.
@export_multiline var message: String = ""
## The text for the choice that leads into this dialogue branch.
@export var choice_text: String = ""
## Choices that the player can choose in dialogue.
@export var choices: Array[DialogueBranch] = []
## Name of the function that gets called when the dialogue starts for this message.
@export var callback_on_begin: String
## Name of the function that gets called when the dialogue ends for this message.
@export var callback_on_finished: String
