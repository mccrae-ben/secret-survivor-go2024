extends Node
class_name SecretsManager

#this class will handle generating and apply secrets to player. 
#this class will hold the secrets pool
@export var secrets_pool: Array[SecretData] = []
@export var experience_manager: ExperienceManager

var current_secrets: Array[Node2D]
var current_upgrades = {}

var see_exp_orbs_secret = preload("res://scenes/secrets/secret/show_exp_orbs_secret.tscn")

func _ready():
	experience_manager.leveled_up.connect(on_leveled_up)		
		
func apply_secret_upgrade(_secret_data: SecretData): #this is called after a user picks an upgrade
	if _secret_data.secret_id == null:
		return
	
	var has_upgrade = current_upgrades.has(_secret_data.secret_id)
	
	if !has_upgrade:
		var secret_upgrade = _secret_data
		var secret_upgrade_controller_instance = secret_upgrade.secret_controller_scene.instantiate()
		add_child(secret_upgrade_controller_instance)
		current_upgrades[_secret_data.secret_id] = {
			"resource" : _secret_data,
			"quantity" : 1
		}
		GameEvents.emit_secret_granted(_secret_data)
		
func _unhandled_input(evt: InputEvent) -> void:
	if evt.is_action_pressed("ui_accept"):
		apply_secret_upgrade(secrets_pool[0])
		
func on_leveled_up():
	pass
	#this is where you will instantiate ui elements that allow user to choose
	

	
