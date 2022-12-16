extends KinematicBody2D

const GRAVITY = 1200.0
const WALK_SPEED = 400

var velocity = Vector2()

func _physics_process(delta):
	if(!is_on_floor()):
		velocity.y += delta * 1.5 *GRAVITY	
	else:
		if Input.is_action_pressed("ui_up"):
			velocity.y = -1.2*WALK_SPEED
	
	

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		get_node("AnimatedSprite").set_flip_h(false)
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		get_node("AnimatedSprite").set_flip_h(true)
	else:
		velocity.x = 0

	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
# warning-ignore:return_value_discarded
	move_and_slide(velocity, Vector2(0, -1))
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
