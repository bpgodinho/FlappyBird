extends Control

@onready var button_sound: AudioStreamPlayer = $buttonSound
@onready var play_button: Button = %PlayButton
@onready var leaderboard_button: Button = %LeaderboardButton
@onready var quit_button: Button = %QuitButton
@onready var leaderboard: Leaderboard = %Leaderboard
@onready var darken: TextureRect = $Darken
@onready var leaderboard_back: Button = %LeaderboardBack

var backable := false

func _on_play_pressed() -> void:
	button_sound.play()
	play_button.icon = preload("res://Art/buttonClicked.png")
	await button_sound.finished
	get_tree().change_scene_to_file("res://Level/Level.tscn")


func _on_leaderboard_pressed() -> void:
	button_sound.play()
	SaveManager.load_game()
	leaderboard.reload()
	var tween = create_tween()
	tween.tween_property(darken,"self_modulate",Color(1,1,1,1),0.2)
	tween.tween_property(leaderboard_back,"position:y",0,0.3)
	await tween.finished
	backable = true


func _on_erase_data_pressed() -> void:
	SaveManager.data.highscore = 0
	SaveManager.data.clear_leaderboard()
	SaveManager.save_game()


func _on_quit_pressed() -> void:
	button_sound.play()
	quit_button.icon = preload("res://Art/buttonClicked.png")
	await button_sound.finished
	get_tree().quit()


func _on_leaderboard_back_pressed() -> void:
	if backable:
		var tween = create_tween()
		tween.tween_property(darken,"self_modulate",Color(1,1,1,0),0.2)
		tween.tween_property(leaderboard_back,"position:y",-720,0.3)
	backable = false
