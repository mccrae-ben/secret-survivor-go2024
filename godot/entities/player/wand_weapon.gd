extends Node2D

@export var bullet: PackedScene

var can_shoot: bool = true
var go_parent: Node2D
@onready var muzzle_marker: Marker2D = %Marker2D
@onready var fire_timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	go_parent = get_tree().get_first_node_in_group("GameObjectsParent")
	fire_timer.start()
	fire_timer.timeout.connect(on_fire_rate_timer_timeout)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if can_shoot and Input.is_action_pressed("shoot"):
		can_shoot = false
		fire_timer.start()
		var bullet_instance = bullet.instantiate() as Bullet
		go_parent.add_child(bullet_instance)
		bullet_instance.global_position = muzzle_marker.global_position
		bullet_instance.bullet_target = global_position - get_global_mouse_position()
		bullet_instance.rotation = (global_position - get_global_mouse_position()).angle()
	
func on_fire_rate_timer_timeout():
	can_shoot = true