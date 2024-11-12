extends Node2D

@export var max_health : float # O Noah quis usar Float

@onready var current_health : float = max_health
@onready var breaking_animation := $AnimatedSprite2D

signal fall_to_pieces()

func receive_damage(damage:float) -> void:
	current_health -= damage
	current_health = clamp(current_health, 0.0, max_health)
	print(current_health)
	update_state()


func update_state() -> void:
	breaking_animation.frame = remap(current_health, max_health, 0, 0, 5)
	if current_health == 0:
		fall_to_pieces.emit()
		queue_free()
