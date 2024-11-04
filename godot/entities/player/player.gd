extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

@onready var health_component: HealthComponent = $HealthComponent
	

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

	print(health_component.current_health)
	move_and_slide()
