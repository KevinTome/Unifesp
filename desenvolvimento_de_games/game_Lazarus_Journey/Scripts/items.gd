extends Area2D

var readyto_interact

signal interacted

func _on_items_body_entered(body):
	$Text.visible = true
	readyto_interact = true
	
func _on_items_body_exited(body):
	$Text.visible = false
	readyto_interact = false

func _input(event):
	if event.is_action_pressed("interact") and readyto_interact:
		queue_free()
		emit_signal("interacted")
