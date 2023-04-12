class_name Bullet extends Area2D

@export_category("Bullet Settings")
@export var lifetime: float = .5
@export var damage: float = 1
@export var speed: float = 1000

func _ready() -> void:
	await get_tree().create_timer(lifetime, false).timeout
	queue_free()

func _on_Bullet_area_entered(body):
	if body.has_method("is_hit"):
		body.is_hit()
	queue_free()
