extends Line2D

var origin: Vector2
var end: Vector2
var new_end: Vector2
	
func _physics_process(delta):
	origin = origin.move_toward(end, 50)
	new_end = new_end.move_toward(end, 80)
	set_point_position(0, origin)
	set_point_position(1, new_end)
