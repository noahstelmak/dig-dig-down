extends CharacterBody2D

class_name Enemy

@export var max_health := 30 
@onready var current_health : float = max_health
var knockback := Vector2.ZERO

signal imdying 

func receive_damage(damage:float, knockback_power:float, font_of_damage_position : Vector2) -> void:
	var knockback_direction = font_of_damage_position.direction_to(global_position)
	knockback = knockback_direction * knockback_power
	
	current_health -= damage
	current_health = clamp(current_health, 0.0, max_health)
	print(current_health)
	
	if current_health <= 0.0:
		imdying.emit()
