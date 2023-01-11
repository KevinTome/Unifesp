extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
onready var isWall := $WallDetector as RayCast2D

#func _process(_delta):
#	if Input.is_action_pressed("move_right"):
#		_animated_sprite.play("run")
#	else:
#		_animated_sprite.stop()
#

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 250
const JUMP_HEIGHT = -500
var motion = Vector2()
var direction := Vector2.ZERO
var last_dir=0

func _physics_process(delta):
	#motion.y += GRAVITY
	var friction = false
	direction.x = Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	
	if(direction.x!=0):
		print(direction.x)
		last_dir = direction.x
		#if(is_on_floor()):
		isWall.scale.x = direction.x
		print(motion.x)
		if(Input.is_action_pressed("move_right")):
			motion.x = min(motion.x+(ACCELERATION*direction.x), direction.x*MAX_SPEED)
		if(Input.is_action_pressed("move_left")):
			motion.x = max(motion.x+(ACCELERATION*direction.x), direction.x*MAX_SPEED)
		$Sprite.scale.x = direction.x
		
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		
	if last_dir >= 1 and isWall.is_colliding() and !is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.x = -MAX_SPEED*2
			motion.y = JUMP_HEIGHT
			isWall.scale.x = direction.x*-1
		else:
			motion.y = GRAVITY
	elif last_dir <= -1 and isWall.is_colliding() and !is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.x = MAX_SPEED*2
			motion.y = JUMP_HEIGHT
			isWall.scale.x = direction.x
		else:
			motion.y = GRAVITY
	else: 
		motion.y += GRAVITY*1.5
		if is_on_floor():
			if Input.is_action_just_pressed("jump"):
				motion.y = JUMP_HEIGHT
			if(friction == true):
				motion.x = lerp(motion.x, 0, 0.2)
		else:
			if(motion.y < 0):
				$Sprite.play("Jump")
			else:
				$Sprite.play("Fall")			
			if(friction == true):
				motion.x = lerp(motion.x, 0, 0.05)		
	
		
	motion = move_and_slide(motion, UP)
	pass

