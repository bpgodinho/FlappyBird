shader_type canvas_item;

uniform float speed = 0.0;
uniform float controlled_time = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float movement = speed * controlled_time;
	COLOR = texture(TEXTURE, vec2(UV.x + movement, UV.y));
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
