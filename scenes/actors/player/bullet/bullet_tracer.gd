extends Line2D

func animate(origin, end):
	add_point(origin)
	add_point(end)
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(0, 0, 0, 0), .5).set_trans(Tween.TRANS_EXPO)
	tween.tween_callback(queue_free)
