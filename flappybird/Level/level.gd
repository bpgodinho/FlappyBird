extends Node2D

@onready var pipe_spawner: Path2D = $PipeSpawner
@onready var pipe_spawn_position: PathFollow2D = $PipeSpawner/PipeSpawnPosition
@onready var score_label: Label = $ScoreLabel
@onready var pipe_spawn_timer: Timer = $PipeSpawnTimer
@onready var death_hud: CanvasLayer = $DeathHud
@onready var hit_effect: ColorRect = $HitEffect
@onready var cartoon_game_over: AudioStreamPlayer = $CartoonGameOver

@export var score_area: PackedScene
@export var pipe: PackedScene
@onready var background: TextureRect = $Background

var tween = Tween


func _process(delta: float) -> void:
	score_label.text = str(GameManager.score)

func _ready() -> void:
	_on_pipe_spawn_timer_timeout()

func _on_pipe_spawn_timer_timeout() -> void:
	var pipe := pipe.instantiate() as DoublePipe
	pipe_spawn_position.progress_ratio = randf()
	pipe.position = pipe_spawn_position.position
	add_child(pipe)
	
func _on_player_hit() -> void:
	tween = create_tween()
	tween.tween_property(hit_effect, "self_modulate", Color(1,1,1,0),0.1).from(Color(1,1,1,1))
	cartoon_game_over.play()
	background.pause(true)
	get_tree().call_group("pipe","stop")
	pipe_spawn_timer.stop()
	death_hud.show()


func _on_death_hud_restart() -> void:
	background.pause(false)
	GameManager.restart()
	get_tree().reload_current_scene()
