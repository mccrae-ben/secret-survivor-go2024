extends CharacterBody2D

const MAX_SPEED = 40

@onready var health_component: HealthComponent = $HealthComponent

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_direction_to_player():
	var player_nodes = get_tree().get_first_node_in_group("Player") as Node2D

	if player_nodes != null:
		#subtracting two vectors provides a direction. in this case subtract player v from enemy v
		return (player_nodes.global_position - global_position).normalized()
	return Vector2.ZERO