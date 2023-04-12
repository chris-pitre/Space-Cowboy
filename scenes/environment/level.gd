class_name Level
extends Node2D

@export_category("Node Settings")
@export var actors: Node2D
@export var shadows_container: CanvasGroup
@export var projectiles_container: CanvasGroup

@export_category("Level Settings")
@export var shadow_color: Color

const SHADOW = preload("res://scenes/effects/shadow.tscn")

func _ready() -> void:
	for actor in actors.get_children():
		if actor.cast_shadow:
			add_shadow(actor, actor.shadow_size, actor.shadow_num_points)

## Handles adding shadows to nodes
func add_shadow(node: Node, size: int, num_points: int) -> void:
	var new_shadow = SHADOW.instantiate()
	shadows_container.add_child(new_shadow)
	new_shadow.caster = node
	new_shadow.shadow_color = shadow_color
	new_shadow.shadow_size = size
	new_shadow.num_points = num_points
	node.connect("tree_exiting", new_shadow.queue_free)
