extends CharacterBody2D
class_name Bullet

@export var SPEED := 350

var target


func _ready() -> void:
	velocity = global_position.direction_to(target) * SPEED


func _physics_process(delta: float) -> void:
	move_and_slide()
