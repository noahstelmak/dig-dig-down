extends BaseChunk

# Estou usando a classe BaseChunk para garantir que o atributo
# "chunk" de BaseOre será um objeto válido

var target = null;

func _physics_process(delta):
	if target:
		global_position = global_position.move_toward(target.global_position, 200 * delta)
	
func _on_collection_area_body_entered(body):
	if body is Player:
		Globals.COIN_ORE_COUNT += coin_value;
		queue_free()


func _on_attract_area_body_entered(body):
	if body is Player:
		target = body


func _on_attract_area_body_exited(body):
	if body is Player:
		target = null
