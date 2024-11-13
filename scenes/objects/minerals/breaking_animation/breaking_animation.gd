extends AnimatedSprite2D


func update_state(current_health : float, max_health : float) -> void:
	frame = remap(current_health, max_health, 0, 0, 5)
