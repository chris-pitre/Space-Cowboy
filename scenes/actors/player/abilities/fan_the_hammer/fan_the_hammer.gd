class_name FanTheHammer
extends Ability

@onready var bullet_tracer = preload("res://scenes/actors/player/bullet/bullet_tracer.tscn")

func do_ability(actor: Actor):
	for i in range(actor.ammo):
		var bullet_direction = actor.get_local_mouse_position().normalized() * 1024
		var spread = randf_range(-0.02, 0.02)
		bullet_direction = bullet_direction.rotated(spread)
		var hitscan = PhysicsRayQueryParameters2D.create(actor.position, actor.to_global(bullet_direction))
		hitscan.exclude = [self]
		var result = actor.space.intersect_ray(hitscan)
		
		var bullet = bullet_tracer.instantiate()
		get_parent().add_child(bullet) 
		bullet.origin = -actor.to_local(Vector2.ZERO)
		bullet.add_point(bullet.origin)
		if result:
			bullet.end = result.position
			if result.collider.has_method("is_hit"):
				result.collider.is_hit(1)
		else:
			bullet.end = actor.to_global(bullet_direction)
		bullet.new_end = bullet.origin
		bullet.add_point(bullet.new_end)
		await get_tree().create_timer(.04).timeout
	
	actor.ammo = 0
