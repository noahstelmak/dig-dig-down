extends Node2D

@onready var animation := $AnimationPlayer
signal start_game


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		animation.play("start_game")

# Criei a função pra chamar no meio da animação
func emit_signal_start_game():
	start_game.emit()
