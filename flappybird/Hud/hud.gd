extends CanvasLayer

signal restart

@onready var score_audio: AudioStreamPlayer = $ScoreAudio
@onready var score: Label = $Score
@onready var win_chime: AudioStreamPlayer = $WinChime
@onready var your_score: Label = $YourScore
@onready var leaderboard: VBoxContainer = $Leaderboard
@onready var restart_button: TextureButton = $HBoxContainer/Restart
@onready var main_menu_button: TextureButton = $HBoxContainer/MainMenu
@onready var button_sound: AudioStreamPlayer = $ButtonSound

func _on_restart_pressed() -> void:
	score.text = "0"
	button_sound.play()
	await button_sound.finished
	restart.emit()


func _on_main_menu_pressed() -> void:
	GameManager.restart()
	button_sound.play()
	await button_sound.finished
	get_tree().change_scene_to_file("res://Menu/Menu.tscn")


func _on_player_hit() -> void:
	your_score.text = "YOUR SCORE"
	await get_tree().create_timer(0.3).timeout
	score.show()
	var tween = create_tween()
	tween.tween_method(count_up,0,GameManager.score,GameManager.score * 0.1)
	await tween.finished
	if GameManager.new_highscore:
		your_score.text = "NEW HIGHSCORE!"
		win_chime.play()
		GameManager.new_highscore = false

func count_up(count: int) -> void:
	if score.text != str(count):
		score_audio.play()
		score.text = str(count)
