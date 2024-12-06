extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	linear_velocity = Vector2(-((GameManager.difficulty*5 + 1) * 100),0)
