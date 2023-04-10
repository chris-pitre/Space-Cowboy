extends Node2D

@export var action_name: String

func _on_interact_area_body_entered(body) -> void:
	if body is Player:
		visible = true

func _on_interact_area_body_exited(body) -> void:
	if body is Player:
		visible = false

# This should be prettier and able to support more keys
# Should grab info from the InputMap
