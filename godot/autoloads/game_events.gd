extends Node

signal show_exp_orbs_activated(somethingrandomhere: float)

func emit_show_exp_orbs_activated(show_orb_chance: float):
	show_exp_orbs_activated.emit(show_orb_chance)
