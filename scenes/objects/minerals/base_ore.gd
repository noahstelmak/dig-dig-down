extends StaticBody2D

class_name Ore

@export var max_health : float # O Noah quis usar Float
@export var chunk : PackedScene

@onready var chunk_instance = chunk.instantiate()
@onready var current_health : float = max_health


signal health_changed(current_health : float, max_health : float)


func _ready() -> void:
	assert(chunk_instance is BaseChunk, "Exported var 'chunk' must be an instance of 'BaseChunk'")


# Sempre que quiser reduzir a vida do minério, chamar este método
func receive_damage(damage:float) -> void:
	current_health -= damage
	current_health = clamp(current_health, 0.0, max_health)
	print(current_health)
	health_changed.emit(current_health, max_health)
	
	if current_health <= 0.0:
		spawn_chunk()
		queue_free()


# Este método spawna o chunk na posição que o ore estiver
# TODO: Depois da arquitetura do mapa tiver pronta, da pra transformar este
#       método num sinal e deixar os nodes pais lidarem com ele
func spawn_chunk() -> void:
	chunk_instance.position = position
	get_parent().add_child(chunk_instance)
