extends Area2D

signal experience_orb_picked_up(experience_to_grant_to_player: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_area_entered(other_area: Area2D):
	print(other_area.get_parent().get_class(),other_area.owner.is_class("ExperienceOrb"),"   ",other_area.name)
	if other_area == null:
		return
	
		
	if other_area.owner.is_class("ExperienceOrb"):
		print(other_area.exp_to_grant, "exp")
		experience_orb_picked_up.emit(other_area.exp_to_grant)
	
	
