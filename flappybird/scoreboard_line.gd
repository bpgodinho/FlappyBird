@tool 
extends HBoxContainer

@onready var highscore: Label = $Highscore
@onready var time: Label = $Time

@export var highscore_text: String:
	set(value):
		highscore_text = value
		highscore.text = value

@export var time_diff: String:
	set(value):
		time_diff = value
		time.text = str(value)
