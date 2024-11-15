extends Node2D

@onready var current_floor := $CurrentFloor


func _ready() -> void:
	current_floor.go_to_next_floor()


func fade_in():
	pass


func fade_out():
	pass


func _on_current_floor_changing_scene() -> void:
	pass # Replace with function body.
