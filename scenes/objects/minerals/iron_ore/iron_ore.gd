extends BaseOre

# Acabei conseguindo fazer tudo via sinal e com a classe pai, mas vou manter essa
# classe aqui porque vai que precisa customizar o comportamento de minérios separados


func _on_timer_timeout() -> void:
	receive_damage(10)
