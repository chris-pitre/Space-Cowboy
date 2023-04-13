class_name Dummy extends Actor

var total_damage: int = 0

func _ready():
	height = -8

func get_movement_direction() -> Vector2:
	return Vector2.ZERO

func is_hit(damage: float) -> void:
	total_damage += damage
	$Control/Container/Damage.text = "damage: %s" % str(damage)
	$Control/Container/TotalDamage.text = "total damage: %s" % str(total_damage)
