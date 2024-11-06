extends Node

#get the player and use it as a spawn point around a radius
#create a timer and each time it times out you spawn an enemy based on current level
#have a dictionary of enemies with a level id

@export var basic_enemy: PackedScene

var SPAWN_RADIUS 
var player: Player
var enemy_tree_parent: Node2D

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	enemy_tree_parent = get_tree().get_first_node_in_group("EnemyLayer")
	SPAWN_RADIUS = (get_viewport().size.y / 3) + 100
	timer.timeout.connect(spawn_enemy)


func get_spawn_position() -> Vector2:
	var final_spawn_position = Vector2.ZERO
	var initial_spawn_position = player.global_position
	var random_point = Vector2.RIGHT.rotated(randf_range(0,TAU)) 

	for i in 4:
		#now we multiply that random direction by the radius to scale the circle to be outside the viewport
		final_spawn_position = initial_spawn_position + (random_point * SPAWN_RADIUS)
		var query_parameters = PhysicsRayQueryParameters2D.create(initial_spawn_position, final_spawn_position, 1 << 0) #1<<0 is bitshifting aka a way to find the layer we want to pay attention to
		var raycast_result = get_tree().root.world_2d.direct_space_state.intersect_ray(query_parameters)

		if raycast_result.is_empty(): #if raycast is empty then no obstacle was detected and we can use this value
			break #stop because we've found a valid spawn point
		else:
			random_point = random_point.rotated(deg_to_rad(90)) #taking the random direction and rotating it 90d

	return final_spawn_position

func spawn_enemy():
	timer.start()
	var spawn_pos = get_spawn_position()
	var enemy_instance = basic_enemy.instantiate()  as Node2D
	enemy_tree_parent.add_child(enemy_instance)
	enemy_instance.position = spawn_pos