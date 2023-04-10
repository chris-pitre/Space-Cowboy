extends Control

var text: String = "":
	set(x):
		text = x
		$HBoxContainer/Label.text = x

func hover() -> void:
	$HBoxContainer/Label.text = "> " + text

func dehover() -> void:
	$HBoxContainer/Label.text = text
