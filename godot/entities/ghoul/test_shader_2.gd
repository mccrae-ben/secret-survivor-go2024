
extends Sprite2D

var updated_hit_point = Vector2(0,0)
var flash_from_front = false
var flash_from_back = false
var start_time = 1.0
@export var my_parent: GhoulBasic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	my_parent.hit_direction.connect(on_hit)

func _process(delta: float) -> void:
	if flash_from_front:
		flash(custom_timer())
			
func on_hit(_hit_dir: Vector2, _hit_angle: float):
	start_time = 1.0
	material.set_shader_parameter("reset_color", false)
	
	if _hit_dir.x == 1:
		material.set_shader_parameter("hit_x_dir", _hit_dir.x)
		material.set_shader_parameter("hit_y_dir", _hit_dir.y)
		material.set_shader_parameter("hit_angle", _hit_angle)
		material.set_shader_parameter("uv_progress", 1.0)
		flash_from_front = true
		material.set_shader_parameter("set_active", true)
		
	if _hit_dir.x == -1:
		material.set_shader_parameter("uv_progress", 0.0)
		material.set_shader_parameter("hit_x_dir", 0.0)
		flash_from_front = true
		material.set_shader_parameter("set_active", true)	

func flash(_u_time: float):
	material.set_shader_parameter("u_time", _u_time)
	
func custom_timer() -> float:
	var speed = .05
	start_time -= speed
	if start_time <= 0:
		flash_from_front = false
		material.set_shader_parameter("reset_color", true)
	return start_time
	