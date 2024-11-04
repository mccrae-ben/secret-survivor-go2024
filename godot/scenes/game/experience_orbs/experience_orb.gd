extends Node2D

func _process(_delta: float) -> void:
	if GameManager.show_orbs:
		visible = true
	else:
		visible = false
			
		
