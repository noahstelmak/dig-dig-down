extends Area2D

@export var next_floor : PackedScene
@export var batata : String

var is_player_inside := false

signal exit_entered()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_player_inside and Input.is_action_just_pressed("ui_accept"):
		print("emitiu saida")
		exit_entered.emit()


func _on_body_entered(_body: Node2D) -> void:
	print("player dentro")
	is_player_inside = true


func _on_body_exited(_body: Node2D) -> void:
	print("player fora")
	is_player_inside = false
