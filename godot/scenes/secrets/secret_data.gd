extends Resource
class_name SecretData

#holds all the data and a reference to the controller

@export var secret_controller_scene : PackedScene
@export var secret_name : String
@export_multiline var secret_description: String
@export var max_upgrades : int

