extends Sprite2D

var updated_hit_point = Vector2(0,0)
var can_flash_backward = false
var can_flash_forward = false
@export var my_parent: GhoulBasic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	my_parent.hit_direction.connect(on_hit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_flash_backward:
		flash_hit_from_front()
		
	if can_flash_forward:
		flash_hit_from_back()
	
func on_hit(_hit_dir: Vector2):
	material.set_shader_parameter("reset_color", false)
	updated_hit_point = _hit_dir
	material.set_shader_parameter("hit_point", updated_hit_point) 
	if _hit_dir.x > 0:
		can_flash_backward = true
	else:
		can_flash_forward = true
	
func flash_hit_from_front():
	updated_hit_point.x -= .05
	updated_hit_point.y -= .05
	material.set_shader_parameter("hit_point", updated_hit_point)
	
	if updated_hit_point.x <= -1:
		material.set_shader_parameter("reset_color", true)
		can_flash_backward = false
	#print("mat",material.get("shader_parameter/hit_point"))

func flash_hit_from_back():
	updated_hit_point.x += .05
	updated_hit_point.y += .05
	material.set_shader_parameter("hit_point", updated_hit_point)
	#print("mat",material.get("shader_parameter/hit_point"))
	#	if updated_hit_point == Vector2(-1,-1):
	#		updated_hit_point.x += .05
	#		updated_hit_point.y += .05	
	#		material.set_shader_parameter("hit_point", updated_hit_point)

	if updated_hit_point.x >= 1:
		material.set_shader_parameter("reset_color", true)
		can_flash_backward = false
#print("mat",material.get("shader_parameter/hit_point"))


func flash_hit_forward():
	if updated_hit_point.x < 1 and updated_hit_point.x >= 0:
		updated_hit_point.x += .05
		material.set_shader_parameter("hit_point", updated_hit_point)
		#print("mat",material.get("shader_parameter/hit_point"))		
		
	if(updated_hit_point.x >= 1):
		can_flash_forward = false
		material.set_shader_parameter("reset_color", true)
     
