extends Node2D

var caster: Node2D
var shadow_size: int = 8
var shadow_color: Color = Color(0, 0, 0)

func _draw() -> void:
	draw_shadow(shadow_size, shadow_color)

func _process(_delta) -> void:
	if caster:
		global_position = caster.global_position

func draw_shadow(size, color):
	var num_points = 8
	var points = PackedVector2Array()
	
	for i in range(num_points):
		var angle_point = deg_to_rad(i * (360.0 / num_points))
		points.push_back(Vector2(cos(angle_point), sin(angle_point) / 2) * size)
	
	for index_point in range(num_points):
		draw_polygon(points, PackedColorArray([color]))
