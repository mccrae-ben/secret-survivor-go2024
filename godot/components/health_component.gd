extends Node
class_name HealthComponent

signal died
signal health_changed

@export var max_health: float = 10
var current_health

func _ready():
	current_health = max_health

func damage(damage_amount: float):
	current_health = max(current_health - damage_amount, 0) #enforces we never drop below zero
	health_changed.emit()
	Callable(check_death).call_deferred() #defer the call


func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free() #owner is the root parent of where this component is dropped

func get_health_percent():
	if max_health == 0:
		return 0

	return min(current_health / max_health, 1)