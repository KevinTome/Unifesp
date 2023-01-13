extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
onready var isWall := $WallDetector as RayCast2D
onready var audio_player = $AudioPlayerMenager

#func _process(_delta):
#	if Input.is_action_pressed("move_right"):
#		_animated_sprite.play("run")
#	else:
#		_animated_sprite.stop()
#
var MAX_SPEED = 250
var JUMP_HEIGHT = -500

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const WIND = -30
var motion = Vector2()
var direction := Vector2.ZERO
var last_dir=0
var qtde_roupa = 0


func _physics_process(delta):
	MAX_SPEED = ParametrosGlobais.MAX_SPEED
	JUMP_HEIGHT = ParametrosGlobais.JUMP_HEIGHT
	
	var friction = false
	direction.x = Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	
	if(direction.x!=0):
		last_dir = direction.x
		isWall.scale.x = direction.x
		if(Input.is_action_pressed("move_right")):
			motion.x = min(motion.x+(ACCELERATION*direction.x), direction.x*MAX_SPEED)
		if(Input.is_action_pressed("move_left")):
			motion.x = max(motion.x+(ACCELERATION*direction.x), direction.x*MAX_SPEED)
		$Sprite.scale.x = direction.x*0.1
		
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
	motion.y += GRAVITY*1.5
	if Input.is_action_pressed("shift_hold"):
		if last_dir >= 1 and isWall.is_colliding() and !is_on_floor():
			if Input.is_action_just_pressed("jump"):
				$Sprite.play("Jump")
				motion.x = -MAX_SPEED*2
				motion.y = JUMP_HEIGHT
				isWall.scale.x = direction.x*-1
			else:
				motion.y = GRAVITY
		elif last_dir <= -1 and isWall.is_colliding() and !is_on_floor():
			if Input.is_action_just_pressed("jump"):
				$Sprite.play("Jump")
				motion.x = MAX_SPEED*2
				motion.y = JUMP_HEIGHT
				isWall.scale.x = direction.x
			else:
				motion.y = GRAVITY
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			$Sprite.play("Jump")
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
	
	if(get_tree().current_scene.filename=="res://Scenes/fase02_campos.tscn"):
		if(ParametrosGlobais.qtde_roupa==0): motion.x += WIND
	

	motion = move_and_slide(motion, UP)
	pass



func _on_interacted():
	ParametrosGlobais.add_roupa()
	if(ParametrosGlobais.qtde_roupa==3): ParametrosGlobais.MAX_SPEED -= 20
	if(ParametrosGlobais.qtde_roupa==4): ParametrosGlobais.MAX_SPEED -= 20
