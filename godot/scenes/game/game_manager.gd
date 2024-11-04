extends Node

var show_orbs: bool = false

func _ready():
	GameEvents.show_exp_orbs_activated.connect(on_exp_orbs_secret_activated)
	
func on_exp_orbs_secret_activated():
	show_orbs = true