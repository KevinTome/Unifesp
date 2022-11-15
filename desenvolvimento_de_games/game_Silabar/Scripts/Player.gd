extends KinematicBody2D

var velocity = Vector2()
var move_speed = 480
var gravity = 1200
var jump_force = -720

func _physics_process(delta):
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	velocity.y += gravity * delta
	velocity.x = move_speed * move_direction
	move_and_slide(velocity)

	if Input.is_action_pressed("jump"):
		velocity.y = jump_force/2
