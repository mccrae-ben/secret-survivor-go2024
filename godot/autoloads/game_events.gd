extends Node

signal adjust_visibility_of_items(viz_key: String, chance_to_show_item: float)

func emit_adjust_viz_signal(viz_key: String, viz_chance_adjustment: float):
	adjust_visibility_of_items.emit(viz_key, viz_chance_adjustment)
