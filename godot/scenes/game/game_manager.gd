extends Node

var show_orbs_chance: float = .5
var chance_item_is_visible: float = .5
var visibility_adjustment_key = "name"
var visibility_adjustment_value = .5
var visibility_adjustment_dict: Dictionary = {visibility_adjustment_key : visibility_adjustment_value}

func _ready():
	GameEvents.adjust_visibility_of_items.connect(update_viz_dict)
	
func update_viz_dict(adjustment_name: String, adjustment_value: float):
	visibility_adjustment_dict[adjustment_name] = adjustment_value
		
func get_viz_chance(adjustment_name: String) -> float:
	return visibility_adjustment_dict[adjustment_name] 
	
