extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/Level.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_erase_data_pressed() -> void:
	SaveManager.data.highscore = 0
	SaveManager.data.clear_leaderboard()
	SaveManager.save_game()
