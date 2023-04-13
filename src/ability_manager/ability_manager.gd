class_name AbilityManager
extends Node

@export var actor: Actor

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

## Performs current ability 
func do_ability() -> void:
	get_child(0).do_ability()

## Returns next ability and orders children
func next_ability() -> Ability:
	var current_ability = get_child(0)
	move_child(current_ability, get_child_count()-1)
	var next_ability = get_child(0)
	add_child(current_ability)
	return next_ability

##  Returns last abiliy and orders children
func last_ability() -> Ability:
	var last_ability = get_child(get_child_count()-1)
	move_child(last_ability, 0)
	return last_ability
