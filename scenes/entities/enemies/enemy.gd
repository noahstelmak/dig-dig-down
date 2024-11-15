extends CharacterBody2D

class_name Enemy

@export var coin_value: int = 1;
@export var max_health := 30 
@onready var current_health : float = max_health
var knockback := Vector2.ZERO

var invunabler = false
signal imdying 

func receive_damage(damage:float, knockback_power:float, font_of_damage_position : Vector2) -> void:
	if invunabler:
		return
	invunabler = true
	
	var knockback_direction = font_of_damage_position.direction_to(global_position)
	knockback = knockback_direction * knockback_power
	
	current_health -= damage
	current_health = clamp(current_health, 0.0, max_health)
	print(current_health)
	
	if current_health <= 0.0:
		imdying.emit()
	
	await get_tree().create_timer(0.3).timeout
	invunabler = false
