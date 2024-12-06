extends CanvasLayer



func _on_restart_pressed() -> void:
	GameManager.restart()


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
