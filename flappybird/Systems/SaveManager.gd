extends Node

const SAVE_PATH := "user://save.res"

var data := SaveData.new()

func _ready() -> void:
	load_game()


func load_game() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		data = ResourceLoader.load(SAVE_PATH)


func save_game() -> void:
	ResourceSaver.save(data,SAVE_PATH)
