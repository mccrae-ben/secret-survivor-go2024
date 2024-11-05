extends Node2D
class_name ExperienceOrb

var show_orb_chance: float
var exp_to_grant: int

@onready var pickup_area: Area2D = $OrbPickupArea

func _ready() -> void:
	GameEvents.adjust_visibility_of_items.connect(on_show_orbs)
	pickup_area.area_entered.connect(on_exp_orb_picked_up)
	
func should_orb_be_visible(show_orb: bool):
	if show_orb:
		visible = true
	else:
		visible = false
	print(show_orb)	
	

func on_show_orbs(viz_upgrade_name: String, show_orbs_chance: float):
	if show_orbs_chance == null:
		printerr("no orb chance")
	
	if show_orbs_chance == 1:
		visible = true
	else:
		visible = false

func set_experience_points(_exp_to_grant: int):
	exp_to_grant = _exp_to_grant 

func on_exp_orb_picked_up(_other_area: Area2D):
	GameEvents.emit_exp_granted(exp_to_grant)
	queue_free()
	
		
