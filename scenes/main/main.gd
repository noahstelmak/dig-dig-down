extends Node

@export var first_scene : PackedScene

@onready var main_menu := $MainMenu
@onready var intro := $intro


@onready var floor_manager := preload("res://scenes/floors/floor_manager/floor_manager.tscn")


func _ready() -> void:
	Globals.player_ded.connect(player_morreu)


func player_morreu():
	var children := get_children()
	for child in children:
		child.queue_free()
	
	var main_menu_scene := load("res://scenes/menu/main_menu/main_menu.tscn")
	var main_menu_instance = main_menu_scene.instantiate()
	
	add_child(main_menu_instance)
	


func _on_main_menu_start_game() -> void:
	main_menu.queue_free()
	var floor_manager_instance := floor_manager.instantiate()
	add_child(floor_manager_instance)


func _on_intro_is_over() -> void:
	main_menu.blocked = false
	main_menu.audio.play()
	intro.queue_free()
