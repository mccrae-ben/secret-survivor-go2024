extends Node

@export var exp_orb: PackedScene
#@export var health_component: HealthComponent
@export_range(0,1) var drop_percent: float = 1  
@export_range(1,5) var number_orbs_to_drop: int = 3
@export_range(0,1) var chance_orb_is_visible: float = .2345

@onready var health_component: HealthComponent = %HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drop_percent = 1 #randf_range(0,1)
	GameManager.update_viz_dict(VisibilityTypes.experience_orb,chance_orb_is_visible)
	number_orbs_to_drop = 10
	health_component.died.connect(on_death)
	
func on_death():
	if randf() > drop_percent:
		return
	
	for i in number_orbs_to_drop:
		var spawn_pos = (owner as Node2D).position	+ Vector2(randi_range(-20,10), randi_range(-20,10))
		var gameobject_parent = get_tree().get_first_node_in_group("GameObjectsParent")	
		var exp_orb_instance = exp_orb.instantiate() as Node2D
		var show_orb: bool = false
		if randf_range(0,1) < GameManager.get_viz_chance(VisibilityTypes.experience_orb):
			show_orb = true
		exp_orb_instance.should_orb_be_visible(show_orb)
		gameobject_parent.add_child(exp_orb_instance)
		exp_orb_instance.position = spawn_pos
