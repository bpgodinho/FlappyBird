extends Node

var difficulty := 0.0
var score := 0
var color_increment := 0.0
var new_highscore := false
var first_start := true

func restart() -> void:
	difficulty = 0.0
	score = 0
	color_increment = 0.0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		print(SaveManager.data.leaderboard)
	if Input.is_action_just_pressed("ui_down"):
		print(Time.get_unix_time_from_system())
	if Input.is_key_pressed(KEY_P):
		SaveManager.data.leaderboard = [Vector2(9,173375399),Vector2(2,173375399),Vector2(3,173375399),Vector2(4,173375399),Vector2(5,173375399)]
		SaveManager.data.highscore = 0

func get_time() -> float:
	return Time.get_unix_time_from_system()
