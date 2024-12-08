shader_type canvas_item;

uniform vec3 newColor;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	 if(COLOR.r - COLOR.g > 0.1 || COLOR.r - COLOR.g < -0.1 || COLOR.g - COLOR.b > 0.1 || COLOR.g - COLOR.b < -0.1) {
		COLOR = texture(TEXTURE,UV);
		float avg = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
		COLOR.rgb = avg + newColor;
	}
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
