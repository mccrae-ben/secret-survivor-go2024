shader_type canvas_item;

void vertex() {

}

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
			COLOR.b = 0.5;
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