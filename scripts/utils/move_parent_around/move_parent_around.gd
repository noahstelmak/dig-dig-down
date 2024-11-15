extends Node2D


@export var distance : = 15
@export var speed : = 15

@onready var rng = RandomNumberGenerator.new()
@onready var parent = get_parent()
@onready var starting_position = parent.position
@onready var next_position : = generate_rng()


func _process(delta) -> void:
	if parent.position == next_position:
		next_position = generate_rng()
	parent.position = parent.position.move_toward(next_position, delta * speed)


func generate_rng() -> Vector2 :
	return Vector2(rng.randf_range(starting_position.x - distance, starting_position.x + distance), rng.randf_range(starting_position.y - distance, starting_position.y + distance))
