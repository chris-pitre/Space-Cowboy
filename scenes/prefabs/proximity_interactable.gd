class_name ProximityInteractable
extends Node2D

var player_in_range: bool = false

func _process(delta) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()

func _on_interact_area_body_entered(body) -> void:
	if body is Player:
		player_in_range = true

func _on_interact_area_body_exited(body) -> void:
	if body is Player:
		player_in_range = false

## Function that is called when the player presses the interact button within range.
func interact() -> void:
	push_error("Interactable doesn't implement <interact> function.")
