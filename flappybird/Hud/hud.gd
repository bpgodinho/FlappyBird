extends CanvasLayer

signal restart

func _on_restart_pressed() -> void:
	restart.emit()


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
