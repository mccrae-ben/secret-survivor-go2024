extends Node2D

func _ready():
	#GameEvents.emit_show_exp_orbs_activated(1)
	GameEvents.emit_adjust_viz_signal(VisibilityTypes.experience_orb,1)
	#here you could play animation etc..
