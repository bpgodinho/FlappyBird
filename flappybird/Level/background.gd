extends TextureRect

var paused := false
var shader_time := 0.0

func _process(delta: float) -> void:
	if !paused:
		material.set_shader_parameter("controlled_time",shader_time)
		shader_time += delta

func pause(mode: bool) -> void:
	paused = mode
