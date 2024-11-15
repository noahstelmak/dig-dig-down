extends CharacterBody2D

const SPEED = 300.0
@onready var nav := $NavigationAgent2D


func _ready() -> void:
	nav.target_position = Vector2(250,100)


func _physics_process(delta: float) -> void:
	var dir = to_local(nav.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()
