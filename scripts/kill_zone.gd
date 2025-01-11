extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("KillZone")




func _on_body_entered(_body: Node2D) -> void:
	if _body.is_in_group("Player"):
		call_deferred("reload_scene")
	elif _body.is_in_group("Enemy"):
		return
		
func reload_scene() -> void:
	get_tree().reload_current_scene()
