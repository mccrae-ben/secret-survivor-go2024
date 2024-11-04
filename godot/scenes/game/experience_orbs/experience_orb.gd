extends Node2D

var show_orb_chance: float

func _ready() -> void:
	GameEvents.show_exp_orbs_activated.connect(on_show_orbs)
	
func should_orb_be_visible(show_orb: bool):
	if show_orb:
		visible = true
	else:
		visible = false
	print(show_orb)	
	

func on_show_orbs(show_orbs_chance: float):
	
	if show_orbs_chance == null:
		printerr("no orb chance")
	
	if show_orbs_chance == 1:
		visible = true
	else:
		visible = false
		
