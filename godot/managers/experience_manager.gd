extends Node
class_name ExperienceManager
#handles leveling up the player and tracking experience 

var current_experience = 0
var current_level = 1
var target_experience_to_level_up = 50
const TARGET_GROWTH_EXPERIENCE = 50 

signal leveled_up(current_lvl: int)
signal experience_updated(current_exp: int, exp_needed_to_lvl_up: int)

# Called when the node enters the scene tree for the first time. hi my name IS what ddddddd
func _ready() -> void:
	GameEvents.exp_granted.connect(on_exp_granted)
	
func increment_experience(exp_to_increment: int):
	current_experience = min(current_experience + exp_to_increment,target_experience_to_level_up)
	experience_updated.emit(current_experience,target_experience_to_level_up)
	leveled_up.emit(current_level)
	
	if current_experience == target_experience_to_level_up:
		current_level += 1
		target_experience_to_level_up += TARGET_GROWTH_EXPERIENCE
		experience_updated.emit(current_experience,target_experience_to_level_up)
		
	print("current_lvl",current_level,"current_exp",current_experience,"target",target_experience_to_level_up)	
		
	
func on_exp_granted(_exp_to_grant: int):
	increment_experience(_exp_to_grant)
