extends Node

@export var first_scene : PackedScene


func _ready():
	if first_scene != null:
		var first_scene_instance = first_scene.instantiate()
		add_child(first_scene_instance)


func goto_floor(next_level : PackedScene):
	var next_level_instance = next_level.instantiate()
	if next_level_instance is Floor:
		call_deferred("_deferred_goto_scene", next_level_instance)
		return
	push_error("INPUT ERROR: next_level doesn't extends Floor")


func _deferred_goto_scene(next_level : Floor):
	if current_level != null:
		current_level.free()
	current_level = next_level
	current_level.end.connect(complete_level)
	add_child(current_level)
