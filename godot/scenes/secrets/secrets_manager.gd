extends Node
class_name SecretsManager

#this class will handle generating and apply secrets to player. 
#this class will hold the secrets pool
@export var secrets_pool = []

var see_exp_orbs_secret = preload("res://scenes/secrets/secret/show_exp_orbs_secret.tscn")

func _ready():
	secrets_pool.append(see_exp_orbs_secret)
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var exp_orb_instance = see_exp_orbs_secret.instantiate()
		add_child(exp_orb_instance)
	
