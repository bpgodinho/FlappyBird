class_name Player extends RigidBody2D

@onready var player: RigidBody2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var flap_sound: AudioStreamPlayer = $FlapSound

signal hit

var dead := false
var jump_strength: float = -700
var idle := true

func _ready() -> void:
	if GameManager.first_start:
		gravity_scale = 0.0
		player_sprite.play("flap")
		intro()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Jump") and !dead:
		idle = false
		linear_velocity.y = jump_strength
		player_sprite.stop()
		player_sprite.play("flap")
		flap_sound.pitch_scale = randf_range(0.95,1.05)
		flap_sound.play()


func _on_body_entered(_body: Node) -> void:
	hit.emit()
	dead = true
	collision_shape_2d.set_deferred("disabled", true)
	apply_impulse(Vector2(150,-300))
	angular_velocity = 10

func intro() -> void:
	var tween = create_tween()
	tween.tween_property(player_sprite,"position:x",9,0.2).from(-150)
	await tween.finished

func _on_player_sprite_animation_looped() -> void:
	if !idle:
		player_sprite.play("idle")
