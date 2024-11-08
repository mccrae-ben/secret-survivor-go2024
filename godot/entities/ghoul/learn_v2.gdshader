shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0, 0.1);
uniform float uv_progress : hint_range(0.0, 1.0, 0.1);
uniform float hit_x_dir = 0.0;
uniform bool set_active = false;
uniform bool reset_color = false;
uniform float u_time;

float set_dir(){
	float dir = hit_x_dir;
	return dir;
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	COLOR = texture(TEXTURE, UV);

	if(set_dir() == 1.0 && set_active) //getting hit from the right
	//1.0 - time until 0
	{
		if(UV.x <= uv_progress) 
		{
			float new_progress = step(UV.x,uv_progress - ((1.0 - u_time)));
			COLOR = vec4(COLOR.r + new_progress,COLOR.g + new_progress,COLOR.b + new_progress, COLOR.a);
		}
	}	
	
	if(set_dir() == 0.0 && set_active) //getting hit from the right
	//1.0 - time until 0
	{
		if(UV.x >= uv_progress) 
		{
			float new_progress = step(UV.x,uv_progress + ((1.0 - u_time)));
			COLOR = vec4(COLOR.r + new_progress,COLOR.g + new_progress,COLOR.b + new_progress, COLOR.a);
		}
	}
	
	if(reset_color){
		COLOR = original_color;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
