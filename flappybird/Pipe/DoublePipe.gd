class_name DoublePipe
extends RigidBody2D

@onready var top_pipe: RigidBody2D = $TopPipe
@onready var top_connector: Sprite2D = $TopPipe/TopConnector
@onready var top_pipe_sprite: Sprite2D = $TopPipe/TopPipeSprite
@onready var bottom_pipe: RigidBody2D = $BottomPipe
@onready var bottom_connector: Sprite2D = $BottomPipe/BottomConnector
@onready var bottom_pipe_sprite: Sprite2D = $BottomPipe/BottomPipeSprite

@export var textures: Array[Array]

var move_speed := -150
var pipes: Array[Sprite2D] = []

func _ready() -> void:
	material.set_shader_parameter("newColor", get_good_color())
	top_connector.global_position.y = 43
	bottom_connector.global_position.y = 679
	top_pipe.linear_velocity.x = move_speed
	bottom_pipe.linear_velocity.x = move_speed
	linear_velocity.x = move_speed

func _on_score_area_body_entered(body: Node2D) -> void:
	GameManager.score += 1


func get_good_color() -> Vector3:
	var newColor: Color = Color.WHITE
	newColor.s = 1.0
	newColor.v = 0.5
	GameManager.color_increment = clamp((GameManager.color_increment + 0.05),0.0,1.0)
	newColor.h = GameManager.color_increment
	return Vector3(newColor.r,newColor.g,newColor.b)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
