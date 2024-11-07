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
	if (reset_color==true) {
		COLOR = texture(TEXTURE,UV);
	}
	else {
		if(starting_hit_point.x == 1.0) //bullet is coming from the right side
	{
		if(UV.x >= hit_point.x) {
			float dist = distance(UV, vec2(1,.5));
			float mod_dist = dist - mod(TIME * speed, 0.75 + wait_time);
			COLOR.b += step(0.5 - circle_width / 2.0, mod_dist) - 1.0;
		}
	}

	if(starting_hit_point.x == 0.0)
	{
		if(UV.x <= hit_point.x) {
			COLOR.b = 0.5;
		}
	}
	}

}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}