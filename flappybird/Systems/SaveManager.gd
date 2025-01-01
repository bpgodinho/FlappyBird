extends Node

const SAVE_PATH := "user://save.tres"

var data := SaveData.new()

func _ready() -> void:
	load_game()
	print(data.leaderboard)


func load_game() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		data = ResourceLoader.load(SAVE_PATH)


func save_game() -> void:
	print(data.leaderboard)
	ResourceSaver.save(data,SAVE_PATH)
