extends StaticBody2D

var already_interacted = false

func _interact_talk():
	already_interacted = true
	$collision.disabled = true

func _on_interact_range_body_entered(body):
	if !already_interacted:
		$text.visible = true

func _on_interact_range_body_exited(body):
	$text.visible = false
