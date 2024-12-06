extends Node2D

@onready var pipe_spawner: Path2D = $PipeSpawner
@onready var pipe_spawn_position: PathFollow2D = $PipeSpawner/PipeSpawnPosition
@onready var score_label: Label = $ScoreLabel
@onready var pipe_spawn_timer: Timer = $PipeSpawnTimer
@onready var death_hud: CanvasLayer = $DeathHud

@export var score_area: PackedScene
@export var pipe: PackedScene

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
	pipe_spawn_timer.stop()
	death_hud.show()
