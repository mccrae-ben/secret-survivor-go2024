extends Node2D

@export_range(0,1) var chance_orb_shows: float = .5

func _ready():
	chance_orb_shows = randf_range(0,1)
	GameEvents.emit_show_exp_orbs_activated(chance_orb_shows)
	#here you could play animation etc..
