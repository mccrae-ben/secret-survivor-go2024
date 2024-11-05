extends Node

signal adjust_visibility_of_items(viz_key: String, chance_to_show_item: float)
signal exp_granted(exp_amount)

func emit_adjust_viz_signal(viz_key: String, viz_chance_adjustment: float):
	adjust_visibility_of_items.emit(viz_key, viz_chance_adjustment)

func emit_exp_granted(_exp_amount_to_grant: int):
	exp_granted.emit(_exp_amount_to_grant)