extends Node

var show_orbs_chance: float = .5

func _ready():
	GameEvents.show_exp_orbs_activated.connect(on_exp_orbs_secret_activated)
	
func on_exp_orbs_secret_activated(show_orb_chance: float):
	show_orbs_chance = 1
