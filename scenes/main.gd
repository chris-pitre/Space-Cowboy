class_name Main
extends Node

@export var level: Level

func _ready() -> void:
	Game.main = self
