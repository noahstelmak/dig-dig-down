extends Area2D

@onready var PLAYER = $"../../Player";
@onready var ANIMATION_PLAYER = $AnimationPlayer;
@onready var NODE2D = $"..";

var digging: bool = false;

func _get_input():
	#Handles the "DIG" tool
	var mouse_position: Vector2 = get_global_mouse_position()
	NODE2D.global_position = PLAYER.global_position.direction_to(mouse_position) * PLAYER.SWING_RANGE + PLAYER.global_position
	NODE2D.look_at(mouse_position);
	
	if PLAYER.global_position.distance_to(mouse_position) > PLAYER.SWING_RANGE:
		NODE2D.rotate(PI/2);
	else:
		NODE2D.rotate(-PI/2);

	# Handles the "DIG" action key 
	if Input.is_action_just_pressed("dig"):
		dig()

func dig():
	digging = true;
	ANIMATION_PLAYER.play("digging")
	digging = false;

func _physics_process(delta):
	_get_input();
		
