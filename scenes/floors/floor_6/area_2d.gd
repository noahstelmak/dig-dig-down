extends Area2D

var entered_once = false


func _on_body_entered(body: Node2D) -> void:
	if entered_once:
		return
	
	var p = get_parent()
	
	p.get_node("wall").visible = true
	p.get_node("wall/CollisionShape2D").disabled = false
	p.get_node("BigBadBoss").enable = true
	
	entered_once = true
