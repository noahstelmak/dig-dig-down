extends CharacterBody2D
class_name  Player

@export var SPEED: float = 300.0;
@export var MAX_HEALTH: float = 100.0;
@export var HEALTH: float = MAX_HEALTH;

var knockback = Vector2.ZERO
var isDying: bool = false;

func _ready():
	pass

func get_input():
	var direction: Vector2 = Input.get_vector('left', 'right', 'up', 'down');
	play_animations(direction)
	handle_movement(direction)

func play_animations(direction: Vector2):
	if direction.length() == 0:
		var angle = get_local_mouse_position().angle()
		if angle > -PI / 4 and angle <= PI / 4:
			$DigTool.z_index = 1
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("idle_side")
		elif angle > PI / 4 and angle <= 3 * PI / 4:
			$DigTool.z_index = 1
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("idle_front")
		elif angle > -3 * PI / 4 and angle <= -PI / 4:
			$DigTool.z_index = 1
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("idle_back")
		else:
			$DigTool.z_index = 1
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("idle_side")
	elif direction.x > 0:
		$DigTool.z_index = 1
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_side");
	elif direction.x < 0:
		$DigTool.z_index = 1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_side");
	elif direction.y > 0:
		$DigTool.z_index = 1
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_front");
	else:
		$DigTool.z_index = 1
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_back");

func handle_movement(direction: Vector2):
	velocity = direction * SPEED + knockback
	knockback = knockback.lerp(Vector2.ZERO, 0.1)
	
func _physics_process(_delta):
	if isDying:
		if $AnimatedSprite2D.is_playing():
			return
		else:
			queue_free()
			
	get_input();
	move_and_slide();


func _on_hit_box_body_entered(body: Node2D) -> void:
	if (body is Enemy or body is Bullet) and not isDying:
		Globals.screan_shake.emit()
		Globals.PLAYER_HEALTH -= 1
		
		if randi_range(0, 1) == 1:
			$ahh.play()
		else:
			$uhh.play()
			
		if Globals.PLAYER_HEALTH <= 0:
			$AnimatedSprite2D.play("dying")
			isDying = true
		
		$DamageAnimation.play("damage")
		
		var knockbackForce = global_position.direction_to(body.global_position) * 500
		if body is Enemy:
			body.knockback = knockbackForce
		knockback = knockbackForce * -1
		
		if body is Bullet:
			body.queue_free()
