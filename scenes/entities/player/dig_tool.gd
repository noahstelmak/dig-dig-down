extends Node2D

@onready var ANIMATION_PLAYER: AnimationPlayer = $AnimationPlayer;

func _get_input():
	#Handles the "DIG" tool position
	var mouse_position: Vector2 = get_global_mouse_position()
	look_at(mouse_position);
	rotate(PI/2)
	
	if Input.is_action_just_pressed("dig"):
		dig()

func dig():
	ANIMATION_PLAYER.play("digging")

func _physics_process(delta):
	_get_input();
