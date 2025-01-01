@tool 
extends HBoxContainer

@onready var highscore: Label = $Highscore
@onready var time: Label = $Time

func _ready() -> void:
	highscore_text = highscore_text
	time_diff = time_diff

@export var highscore_text: String:
	set(value):
		highscore_text = value
		if highscore:
			highscore.text = value

@export var time_diff: String:
	set(value):
		time_diff = value
		if time:
			time.text = str(value)
