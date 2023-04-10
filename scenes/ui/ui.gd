class_name UserInterface
extends Control

@export_category("Dialogue Options")
@export var dialogue_label: RichTextLabel
@export var dialogue_time_per_char: float = 0.08

var current_dialogue_branch: DialogueBranch
var dialogue_running = false

@onready var dialogue_blip = $DialogueMenu/DialogueBlip

func _ready():
	display_text("Hello there hello there hello there")

func display_text(message: String) -> void:
	dialogue_label.text = message
	dialogue_label.visible_characters = 0
	dialogue_running = true
	while dialogue_label.visible_ratio < 1:
		await get_tree().create_timer(dialogue_time_per_char).timeout
		dialogue_blip.play()
		dialogue_label.visible_characters += 1
	dialogue_running = false

func start_dialogue(dialogue_branch: DialogueBranch) -> void:
	current_dialogue_branch = dialogue_branch
	display_text(current_dialogue_branch.text)

func pick_option(option: int) -> void:
	current_dialogue_branch = current_dialogue_branch.options[option]
	display_text(current_dialogue_branch.text)
