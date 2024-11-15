extends Node2D

var current_floor_instance : Floor

signal changing_scene

var current_floor_number = 1

var floor_path_template = "res://scenes/floors/floor_%s/floor_%s.tscn"


func build_floor_path(floor_number : int) -> String:
	return floor_path_template % [floor_number, floor_number]


func goto_scene(next_level : Floor):
	call_deferred("_deferred_goto_scene", next_level)


func _deferred_goto_scene(next_level : Floor):
	if current_floor_instance != null:
		current_floor_instance.free()
	current_floor_instance = next_level
	current_floor_instance.next_floor.connect(go_to_next_floor)
	add_child(current_floor_instance)


func go_to_next_floor():
	var floor_path = build_floor_path(current_floor_number)
	current_floor_number += 1
	var next_floor = load(floor_path)
	var next_floor_instance = next_floor.instantiate()
	
	changing_scene.emit()
	goto_scene(next_floor_instance)
