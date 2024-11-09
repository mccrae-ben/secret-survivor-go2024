extends PanelContainer

@onready var secret_name: Label = %Name
@onready var secret_description: Label = %Description

@export var test_secret: SecretData

signal selected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_secret_card_with_data(test_secret)
	gui_input.connect(on_gui_input)

func set_secret_card_with_data(_secret_data: SecretData):
	secret_name.text = _secret_data.secret_name
	secret_description.text = _secret_data.secret_description
	
func on_gui_input(evt: InputEvent):
	if evt.is_action_pressed("shoot"):
		print("left click happened")
		selected.emit()
		