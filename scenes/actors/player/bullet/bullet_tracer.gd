extends Line2D

var origin: Vector2
var end: Vector2
var new_end: Vector2
	
func _ready():
	await get_tree().create_timer(3).timeout
	queue_free()

func _process(delta):
	origin = origin.move_toward(end, 20)
	new_end = new_end.move_toward(end, 50)
	set_point_position(0, origin)
	set_point_position(1, new_end)
