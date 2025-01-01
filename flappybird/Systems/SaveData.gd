class_name SaveData
extends Resource

@export var highscore := 0
@export var leaderboard :Array[Vector2i]

func update_leaderboard():
	var inserted := false
	@warning_ignore("narrowing_conversion")
	var vector = Vector2i(GameManager.score,Time.get_unix_time_from_system())
	for i in leaderboard.size():
		if leaderboard[i].x < GameManager.score:
			print("comparacoes")
			print(leaderboard[i].x)
			print(GameManager.score)
			print(leaderboard[i].x < GameManager.score)
			leaderboard.insert(i,vector)
			inserted = true
			print("break")
			break
	if !inserted:
		leaderboard.append(vector)
	if leaderboard.size() > 5:
		leaderboard.resize(5)
	if leaderboard[0] == vector:
		GameManager.new_highscore = true
	SaveManager.save_game()


func clear_leaderboard():
	print("clear")
	leaderboard.resize(0)
