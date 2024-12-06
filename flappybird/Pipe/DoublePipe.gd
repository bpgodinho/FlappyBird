class_name DoublePipe
extends RigidBody2D

@onready var top_pipe: RigidBody2D = $TopPipe
@onready var bottom_pipe: RigidBody2D = $BottomPipe

var move_speed := -150

func _ready() -> void:
	top_pipe.linear_velocity.x = move_speed
	bottom_pipe.linear_velocity.x = move_speed
	linear_velocity.x = move_speed


func _on_score_area_body_entered(body: Node2D) -> void:
	GameManager.score += 1
