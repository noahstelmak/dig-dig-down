extends Floor


func _on_exit_exit_entered() -> void:
	next_floor.emit()
