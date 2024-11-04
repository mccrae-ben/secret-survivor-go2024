extends Node2D

func _ready() -> void:
	GameEvents.show_exp_orbs_activated.connect(on_show_orbs)

func on_show_orbs(show_orbs_chance: float):
	print("HELOOOL",show_orbs_chance)
	
	if show_orbs_chance == null:
		printerr("now orb chance")
	
	if GameManager.show_orbs:
		visible = true
	else:
		visible = false
		
