extends Area2D
class_name Bullet
@export var bullet_attributes: BulletData

var speed: float = 0
var bullet_target: Vector2 = Vector2.ZERO

@onready var sprite: Sprite2D = $Sprite2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_bullet_attributes()
	get_tree().create_timer(2).timeout.connect(kill_bullet)
	hitbox_component.area_entered.connect(on_bullet_collision)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed * -bullet_target * delta

func on_bullet_collision(_other_area: Area2D):
	Callable(kill_bullet).call_deferred()

func load_bullet_attributes():	
	sprite.texture = bullet_attributes.texutre
	speed = bullet_attributes.speed

func kill_bullet():
	queue_free()