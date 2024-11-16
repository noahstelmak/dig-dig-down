extends Node2D

@onready var ANIMATION_PLAYER: AnimationPlayer = $DigToolPart/AnimationPlayer;

@export var dig_power := 30.0
@export var pain_power := 10.0
@export var knockback_power := 1000

var toggle_animation = -1

func _get_input():
	var mouse_position: Vector2 = get_global_mouse_position()
	
	scale.x = 1 * toggle_animation
	if global_position.x > mouse_position.x and not ANIMATION_PLAYER.is_playing():
		scale.x = -1 * toggle_animation
	
	look_at(mouse_position);
	rotate(PI/2)
	
	if Input.is_action_just_pressed("dig") and not ANIMATION_PLAYER.is_playing():
		dig()


func dig():
	toggle_animation *= -1
	ANIMATION_PLAYER.play("digging")


func _physics_process(_delta):
	_get_input();


func _on_dig_tool_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.receive_damage(pain_power + Globals.DANO_NIVEL * 10, knockback_power + Globals.DANO_NIVEL * 50, global_position)
		print("enemy!")
		return
	if body is Ore:
		print("Ore!")
		$AudioStreamPlayer.play()
		body.receive_damage(dig_power + Globals.MINERACAO_NIVEL * 15)
		return
