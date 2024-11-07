extends CharacterBody2D
class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var is_shooting = false

@export var player_weapon: Weapon

@onready var health_component: HealthComponent = $HealthComponent
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	player_weapon.shooting.connect(on_shoot)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		pass
		#velocity += get_gravity() * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction : Vector2 = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up","move_down"))
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if !is_shooting: 
		if sign(direction.x) == -1 or Input.is_action_just_released("move_left") or get_global_mouse_position().x < position.x:
			sprite.flip_h = true
		
		if sign(direction.x) == 1 or Input.is_action_just_released("move_right") or get_global_mouse_position().x > position.x:
			sprite.flip_h = false	
	
	if is_shooting:
		if get_global_mouse_position().x < position.x:
			sprite.flip_h = true

		if get_global_mouse_position().x > position.x:
			sprite.flip_h = false
		
	move_and_slide()
	
func on_shoot(_is_shooting: bool):
	is_shooting = _is_shooting
		