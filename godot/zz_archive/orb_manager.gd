extends Node

var all_instantiated_orbs: Array[ExperienceOrb] = []
var hidden_experience_orbs: Array[ExperienceOrb] = []
var hidden_orbs_as_dict = {}

func _ready() -> void:
	pass
#	GameEvents.secret_granted.connect(on_secret_granted)

func add_as_dict(orb: ExperienceOrb, hidden: bool, orb_id: int):
	pass

func add_experience_orb(orb: ExperienceOrb, hidden: bool):
	all_instantiated_orbs.append(orb)
	
	if hidden:
		hidden_experience_orbs.append(orb)
		
func on_secret_granted(_secret: SecretData):
	if _secret.secret_id == "orb_viz":
		do_cool_thing()

func do_cool_thing():
	print("hi in orb",hidden_experience_orbs.size())
	for orb: ExperienceOrb in hidden_experience_orbs:
		await get_tree().create_timer(1).timeout
		orb.should_orb_be_visible(true)		