extends Enemy

var isDying: bool = false;
var SPEED = 300

@export var player : CharacterBody2D
@onready var nav := $NavigationAgent2D
@onready var attackCooldown = $AttackCooldown
var canChange = 0
var enable = false
var target

func _ready() -> void:
	imdying.connect(_on_imdying)
	target = global_position.direction_to(player.global_position)


func _physics_process(delta: float) -> void:
	if not enable:
		return
	
	if isDying:
		queue_free();
		return
	
	if (is_on_wall() or is_on_ceiling() or is_on_floor() or knockback) and attackCooldown.is_stopped():
		Globals.screan_shake.emit()
		knockback = Vector2.ZERO
		if canChange <= 0:
			attackCooldown.start()
	
	if canChange > 0:
		canChange -= delta
	
	velocity = target * SPEED
	
	if not attackCooldown.is_stopped():
		velocity = Vector2.ZERO
	
	if velocity:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("iddle")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()


func _on_imdying():
	isDying = true;


func _on_attack_cooldown_timeout() -> void:
	if player != null:
		target = global_position.direction_to(player.global_position)
		canChange = .5
