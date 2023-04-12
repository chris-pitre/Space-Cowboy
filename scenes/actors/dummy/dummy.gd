class_name Dummy extends Actor

var total_damage: int = 0

func is_hit(damage: float) -> void:
	total_damage += damage
	$Control/Container/Damage.text = "damage: %s" % str(damage)
	$Control/Container/TotalDamage.text = "total damage: %s" % str(total_damage)
