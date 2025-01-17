class_name Leaderboard extends VBoxContainer


func reload() -> void:
	for i in SaveManager.data.leaderboard.size():
		get_child(i).time_diff = timestamp_to_timed_diff(SaveManager.data.leaderboard[i].y)
		get_child(i).highscore_text = str(SaveManager.data.leaderboard[i].x)


func timestamp_to_timed_diff(timestamp: int) -> String:
	var time_diff = int(Time.get_unix_time_from_system()) - timestamp
	if time_diff < 10:
		return("Just now")
	if time_diff < 60:
		return(str(time_diff) + " S AGO")
	elif time_diff < 3540:
		@warning_ignore("integer_division")
		return(str(ceil(time_diff/60)) + " M AGO")
	elif time_diff < 86376:
		@warning_ignore("integer_division")
		return(str(ceil(time_diff/60/60)) + " H AGO")
	else:
		@warning_ignore("integer_division")
		return(str(ceil(time_diff/60/60/24)) + " D AGO")
