extends CanvasLayer

var scene = preload("res://scenes/menu/main_menu/main_menu.tscn").instantiate()

func _ready():
	$AnimationPlayer.play("prisma")
	$AudioStreamPlayer.play()
	await get_tree().create_timer(15).timeout
	#get_tree().change_scene("res://scenes/menu/main_menu/main_menu.tscn")
	get_tree().current_scene = scene

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		#get_tree().change_scene("res://scenes/menu/main_menu/main_menu.tscn")
		get_tree().current_scene = scene
