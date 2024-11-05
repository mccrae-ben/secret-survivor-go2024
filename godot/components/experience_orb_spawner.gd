extends Node

@export var exp_orb: PackedScene
@export var orb_drop_distance: int = 30
@export var drop_percent: float = .5
#@export var health_component: HealthComponent
@export var num_orbs_to_drop_range: Vector2 = Vector2(1,5)
@export var orbs_experience_points: Vector2 = Vector2(1,10)
@export_range(.25,1) var chance_orb_is_visible: float = .25

var number_orbs_to_drop: float = 3
var hidden_experience_orbs: Array[ExperienceOrb] = []
@onready var health_component: HealthComponent = %HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drop_percent = randf_range(.25,1)
	GameManager.update_viz_dict(VisibilityTypes.experience_orb,chance_orb_is_visible)
	GameEvents.secret_granted.connect(on_secret_granted)
	number_orbs_to_drop = randf_range(num_orbs_to_drop_range.x,num_orbs_to_drop_range.y)
	health_component.died.connect(on_death)
	
func on_secret_granted(_secret: SecretData):
	
	if _secret.secret_id == "orb_viz":
		print_debug("in the on secret granted")
		do_cool_thing()
	
func do_cool_thing():
	print("hi in orb")
	for orb: ExperienceOrb in hidden_experience_orbs:
		print_debug("hi fully past all checks")
		await get_tree().create_timer(1).timeout
		orb.should_orb_be_visible(true)
	
func on_death():
	if randf() > drop_percent:
		return
	
	for i in number_orbs_to_drop:
		var spawn_pos = (owner as Node2D).position	+ Vector2(randi_range(-orb_drop_distance,orb_drop_distance), randi_range(-orb_drop_distance,orb_drop_distance))
		var gameobject_parent = get_tree().get_first_node_in_group("GameObjectsParent")	
		var exp_orb_instance = exp_orb.instantiate() as ExperienceOrb
		var show_orb: bool = false
		if randf_range(0,1) < GameManager.get_viz_chance(VisibilityTypes.experience_orb):
			show_orb = true
		else:
			hidden_experience_orbs.append(exp_orb_instance)
		exp_orb_instance.should_orb_be_visible(show_orb)
		exp_orb_instance.set_experience_points(randi_range(orbs_experience_points.x,orbs_experience_points.y))
		gameobject_parent.add_child(exp_orb_instance)
		exp_orb_instance.position = spawn_pos
