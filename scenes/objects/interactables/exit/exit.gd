extends Area2D

@export var next_floor : PackedScene
@export var batata : String

@onready var label := $Label

var is_player_inside := false

signal exit_entered()


func _ready() -> void:
	label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_player_inside and Input.is_action_just_pressed("ui_accept"):
		print("emitiu saida")
		exit_entered.emit()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("player dentro")
		is_player_inside = true
		label.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		print("player fora")
		is_player_inside = false
		label.visible = false
