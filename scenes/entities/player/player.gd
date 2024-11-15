extends CharacterBody2D
class_name  Player

@export var SPEED: float = 300.0;
@export var MAX_HEALTH: float = 100.0;
@export var HEALTH: float = MAX_HEALTH;


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
			$DigTool.z_index = -1
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
	velocity = direction * SPEED;
	
func _physics_process(_delta):
	get_input();
	move_and_slide();
