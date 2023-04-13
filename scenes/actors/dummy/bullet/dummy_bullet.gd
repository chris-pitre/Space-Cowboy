class_name DummyBullet
extends Bullet

func _physics_process(delta):
	position += direction.normalized() * speed

