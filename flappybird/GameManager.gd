extends Node

var difficulty: float = 0.0
var score := 0

func restart() -> void:
	difficulty = 0.0
	score = 0
	get_tree().reload_current_scene()
