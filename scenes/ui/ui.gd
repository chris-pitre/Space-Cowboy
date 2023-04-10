class_name UserInterface
extends Control

# Dialogue doesn't support dialogue tree nodes with only one choice
# Using custom resources is a bit annoying if dialogue trees get large
# Need to support callbacks during dialogue
# Need to add support for a name at the top of the dialogue menu

const CHOICE_LABEL = preload("res://scenes/ui/choice_label/choice_label.tscn")

@export var dialogue_label: RichTextLabel
@export var choices_container: VBoxContainer
@export var choices_panel: Panel

var dialogue_choices = []
var current_dialogue_actor: DialogueActor
var current_dialogue: DialogueBranch
var in_dialogue := false
var dialogue_running := false
var hovered_choice := 0:
	set = set_hovered_choice
var num_choices := 0

@onready var dialogue_menu = $DialogueMenu
@onready var dialogue_blip = $DialogueMenu/DialogueBlip
@onready var dialogue_timer = $DialogueMenu/DialogueTimer

func _ready() -> void:
	Game.user_interface = self

func _process(delta) -> void:
	if in_dialogue:
		if dialogue_running:
			if dialogue_label.visible_ratio == 1:
				end_message()
		if Input.is_action_just_pressed("interact"):
			if dialogue_running:
				dialogue_label.visible_ratio = 1
				end_message()
			else:
				if current_dialogue.choices.size() == 0:
					end_dialogue()
				else:
					choice(hovered_choice)
		if Input.is_action_just_pressed("move_down"):
			if hovered_choice < (num_choices - 1):
				hovered_choice += 1
		if Input.is_action_just_pressed("move_up"):
			if hovered_choice > 0:
				hovered_choice -= 1

## Handles displaying of text in the dialogue message box.
func display_message(message: String) -> void:
	dialogue_label.text = message
	dialogue_label.visible_characters = 0
	dialogue_running = true
	dialogue_timer.start()

## Starts dialogue given a DialogueBranch.
func start_dialogue(dialogue_branch: DialogueBranch, dialogue_actor: DialogueActor) -> void:
	Game.player.movement_locked = true
	in_dialogue = true
	current_dialogue = dialogue_branch
	current_dialogue_actor = dialogue_actor
	get_choices()
	
	# Opening animation.
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(dialogue_menu, "position", Vector2(0, 0.0), 0.5)
	tween.play()
	tween.tween_callback(func():
		display_message(current_dialogue.message)
	)

## Handles ending of dialogue.
func end_dialogue() -> void:
	Game.player.movement_locked = false
	in_dialogue = false
	current_dialogue = null
	current_dialogue_actor.exit_dialogue()
	current_dialogue_actor = null
	dialogue_label.text = ""
	reset_choices()
	num_choices = 0
	
	# Closing animation.
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(dialogue_menu, "position", Vector2(0, 400.0), 0.5)
	tween.play()

## Handles loading of choices from a DialogueBranch into the UI.
func get_choices() -> void:
	num_choices = 0
	if current_dialogue.choices.size() > 1:
		choices_panel.visible = true
		for option in current_dialogue.choices:
			num_choices += 1
			var new_choice_label = CHOICE_LABEL.instantiate()
			choices_container.add_child(new_choice_label)
			dialogue_choices.append(new_choice_label)
			new_choice_label.text = option.choice_text
	else:
		choices_panel.visible = false
	set_hovered_choice(0)

## Called when one message from a DialogueBranch starts displaying.
func start_message() -> void:
	pass

## Called when one message from a DialogueBranch is finished displaying.
func end_message() -> void:
	dialogue_timer.stop()
	dialogue_running = false

func set_hovered_choice(option: int) -> void:
	if num_choices > 0:
		hovered_choice = option
		for choice in dialogue_choices:
			choice.dehover()
		choices_container.get_child(option).hover()

## Picks an option from the dialogue branches.
func choice(option: int) -> void:
	current_dialogue = current_dialogue.choices[option]
	display_message(current_dialogue.message)
	reset_choices()
	get_choices()

func reset_choices() -> void:
	hovered_choice = 0
	for choice in dialogue_choices:
		choice.queue_free()
	dialogue_choices = []

func _on_dialogue_timer_timeout():
	dialogue_blip.play()
	dialogue_label.visible_characters += 1
