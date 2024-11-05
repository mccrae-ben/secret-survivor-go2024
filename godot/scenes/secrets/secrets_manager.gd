extends Node
class_name SecretsManager

#this class will handle generating and apply secrets to player. 
#this class will hold the secrets pool
@export var secrets_pool: Array[SecretData] = []
var current_secrets: Array[Node2D]
var current_upgrades = {}

var see_exp_orbs_secret = preload("res://scenes/secrets/secret/show_exp_orbs_secret.tscn")

func _ready():
	pass		
		
func apply_secret_upgrade(_secret_data: SecretData):
	var has_upgrade = current_upgrades.has(_secret_data.secret_id)
	
	if !has_upgrade:
		var secret_upgrade = _secret_data
		var secret_upgrade_controller_instance = secret_upgrade.secret_controller_scene.instantiate()
		add_child(secret_upgrade_controller_instance)
		print_debug("hi",secret_upgrade_controller_instance.name)
		current_upgrades[_secret_data.secret_id] = {
			"resource" : _secret_data,
			"quantity" : 1
		}
		GameEvents.emit_secret_granted(_secret_data)
		
func _unhandled_input(evt: InputEvent) -> void:
	if evt.is_action_pressed("ui_accept"):
		apply_secret_upgrade(secrets_pool[0])
	

	
