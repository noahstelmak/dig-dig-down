extends CanvasLayer

signal is_over


func _ready():
	$AnimationPlayer.play("prisma")
	$AudioStreamPlayer.play()
	await get_tree().create_timer(15).timeout
	is_over.emit()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		is_over.emit()
