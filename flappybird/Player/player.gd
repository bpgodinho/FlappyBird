extends RigidBody2D

@onready var player: RigidBody2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player_sprite: AnimatedSprite2D = $PlayerSprite

signal hit

var dead := false
var jump_strength: float = -550

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump") and !dead:
		linear_velocity.y = jump_strength
		player_sprite.stop()
		player_sprite.play("flap")


func _on_body_entered(body: Node) -> void:
	hit.emit()
	dead = true
	collision_shape_2d.set_deferred("disabled", true)
	apply_impulse(Vector2(150,-300))
	angular_velocity = 10


func _on_player_sprite_animation_looped() -> void:
	player_sprite.play("idle")
