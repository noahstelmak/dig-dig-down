extends Node2D

@onready var animation := $AnimationPlayer
@onready var audio := $OminousCaveSound

signal start_game

var blocked := true


func _process(_delta: float) -> void:
	if not blocked and Input.is_action_just_pressed("ui_accept"):
		animation.play("start_game")
	if Input.is_action_just_pressed("escape"):
		blocked = false
		audio.play()


# Criei a função pra chamar no meio da animação
func emit_signal_start_game():
	start_game.emit()
