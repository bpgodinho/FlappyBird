extends CanvasLayer

signal restart

@onready var score_audio: AudioStreamPlayer = $ScoreAudio
@onready var score: Label = $Score

func _on_restart_pressed() -> void:
	score.text = "0"
	restart.emit()


func _on_main_menu_pressed() -> void:
	GameManager.restart()
	get_tree().change_scene_to_file("res://Menu/menu.tscn")


func _on_player_hit() -> void:
	await get_tree().create_timer(0.3).timeout
	score.show()
	for i in GameManager.score:
		score.text = str(i + 1)
		score_audio.play()
		await get_tree().create_timer(0.1).timeout
