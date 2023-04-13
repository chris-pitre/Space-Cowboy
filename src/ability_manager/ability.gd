class_name Ability
extends Node

## The Actor this ability belongs to
@export var actor: Actor

## do X ability while available to
func do_ability() -> void:
	push_error("Ability Invalid: This ability does nothing")
	pass

