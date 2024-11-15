extends Enemy

const SPEED = 100.0
@onready var nav := $NavigationAgent2D

var target : Player = null
var targetCooldown = 0
@export var targetRefresh = 0.2

func _ready() -> void:
	nav.target_position = Vector2(250,100)


func _physics_process(delta: float) -> void:
	if target:
		modulate = "#fb0000"
		targetCooldown -= delta
		if targetCooldown <= 0:
			nav.target_position = target.global_position
			targetCooldown = targetRefresh
	else:
		modulate = "#00fb00"
	
	var dir = to_local(nav.get_next_path_position()).normalized()
	
	velocity = dir * SPEED + knockback
	knockback = lerp(knockback, Vector2.ZERO, 0.1)
	
	if nav.is_target_reached():
		velocity = Vector2.ZERO
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		targetCooldown = 0
		target = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		target = null
