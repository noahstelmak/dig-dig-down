extends Enemy

const SPEED = 100.0
@onready var nav := $NavigationAgent2D
@onready var shootTimer := $ShootTimer
@onready var bulletScene := preload("res://scenes/entities/enemies/muscular_eye/bullet.tscn")


var target : Player = null
var targetCooldown = 0
@export var targetRefresh = 0.2

var isDying: bool = false;

func _ready() -> void:
	nav.target_position = Vector2(250,100)
	imdying.connect(_on_imdying)


func _physics_process(delta: float) -> void:
	if isDying:
		Globals.COIN_ORE_COUNT += coin_value
		queue_free();
		return
	
	if target:
		targetCooldown -= delta
		if targetCooldown <= 0:
			nav.target_position = target.global_position
			targetCooldown = targetRefresh
	
	var dir = Vector2.ZERO;
	
	if NavigationServer2D.map_get_iteration_id(nav.get_navigation_map()) > 0:
		dir = to_local(nav.get_next_path_position()).normalized()
	
	if target and target.global_position.distance_to(global_position) < 200:
		dir = Vector2.ZERO
		if shootTimer.is_stopped():
			shootTimer.start()
	
	velocity = dir * SPEED + knockback
	knockback = knockback.lerp(Vector2.ZERO, 0.1)

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


func _on_imdying():
	isDying = true;


func _on_shoot_timer_timeout() -> void:
	if target and target.global_position.distance_to(global_position) < 200:
		var bullet := bulletScene.instantiate()
		bullet.global_position = global_position
		bullet.target = target.global_position
		get_tree().get_root().add_child(bullet)
		
