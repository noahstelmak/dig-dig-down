extends CharacterBody2D

@export var SPEED: float = 300.0;
@export var SWING_RANGE: float = 30.0; 

@export var MAX_HEALTH = 100;
@export var HEALTH = MAX_HEALTH;

func _ready():
	pass

# Handles input
func get_input():
	# Handles movement
	var direction: Vector2 = Input.get_vector('left', 'right', 'up', 'down');
	velocity = direction * SPEED;

func _physics_process(delta):
	get_input();
	move_and_slide();
