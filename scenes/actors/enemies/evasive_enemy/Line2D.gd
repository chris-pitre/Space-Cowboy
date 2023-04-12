extends Line2D


func _process(delta):
	points = get_parent().get_current_navigation_path()
