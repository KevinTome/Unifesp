extends KinematicBody2D

var velocity = Vector2()
var move_speed = 480
var gravity = 1200
var jump_force = -1250 #eixo y é negativo para cima
var is_grounded
var in_interact_range
onready var raycasts = $raycasts

func _physics_process(delta):
	velocity.y += gravity * delta
	
	_get_input()
	velocity = move_and_slide(velocity)
	is_grounded = _check_is_grounded()
	in_interact_range = _check_in_interact()
		
func _get_input():
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
	
	if move_direction != 0:
		$texture.scale.x *= move_direction

func _input(event):
	if event.is_action_pressed("jump") and is_grounded:
		velocity.y = jump_force/2
		
	if event.is_action_pressed("interact") and in_interact_range:
		var talk_collider = $talk_raycast.get_collider()
		talk_collider._interact_talk()
		
func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false
	
func _check_in_interact():
	if $talk_raycast.is_colliding():
		return true
	else:
		return false	

