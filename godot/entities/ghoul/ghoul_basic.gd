extends CharacterBody2D
class_name GhoulBasic

const MAX_SPEED = 5

@onready var health_component: HealthComponent = $HealthComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var colshape: CollisionShape2D = $CollisionShape2D
@onready var ap: AnimationPlayer = $AnimationPlayer

signal hit_direction(dir: int) 

func _ready() -> void:
	health_component.health_changed.connect(on_hit)
	hurtbox_component.area_entered.connect(on_body_entered)
	
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

func on_hit():
	ap.play("flash_hit")
	
func on_body_entered(other_area: Area2D):
	if other_area.owner is Bullet:
		var bullet_area: Bullet = other_area.owner as Bullet
		var bullet_tar = sign(bullet_area.bullet_target.dot(position))
		print(bullet_tar)
		hit_direction.emit(bullet_tar)
	other_area.get_overlapping_areas()
	var other_shape_owner = other_area.shape_find_owner(0)
	var other_shape_node: Shape2D = other_area.shape_owner_get_owner(other_shape_owner).shape
	var shape: Shape2D = other_area.shape_owner_get_shape(0,0)
	