shader_type canvas_item;

void vertex() {

}

uniform float circle_width: hint_range(0.0, 1.0, 0.05) = 0.15;
uniform float wait_time: hint_range(0.0, 5.0, 0.1) = 0.5;
uniform float speed: hint_range(0.0, 10.0, 0.1) = 1.0;
uniform float alpha_boost: hint_range(1.0, 5.0, 0.1) = 2.0;

uniform vec2 hit_point;
uniform vec2 starting_hit_point;
uniform bool reset_color = false;

void fragment() {
	if(UV.x >= hit_point.x && UV.y >= hit_point.y)
	{
		COLOR.r = .5;
	}

	if (reset_color==true) {
		COLOR = texture(TEXTURE,UV);
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}