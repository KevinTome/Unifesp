extends RigidBody2D

var already_interacted = false

onready var pos = position

func _process(delta):
	move()

func _ready(): 
	$text.visible = false

func _interact_talk():
	already_interacted = true
	$collision.disabled = true

func _on_interact_range_body_entered(body):
	if !already_interacted:
		$text.visible = true

func _on_interact_range_body_exited(body):
	$text.visible = false

func move():
	print(pos)
	pos += Vector2(0.15,0)
	set_position(pos)
