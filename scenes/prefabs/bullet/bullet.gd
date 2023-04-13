class_name Bullet extends Area2D

@export_category("Bullet Settings")
@export var lifetime: float = .5
@export var damage: float = 1
@export var speed: float = 1000

var direction: Vector2

func _ready() -> void:
	await get_tree().create_timer(lifetime, false).timeout
	queue_free()

func _physics_process(delta):
	pass

func _on_body_entered(body):
	if body.has_method("is_hit"):
		body.is_hit(damage)
	queue_free()
