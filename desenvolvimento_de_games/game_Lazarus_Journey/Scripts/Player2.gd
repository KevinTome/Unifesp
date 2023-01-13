extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
onready var isWall := $WallDetector as RayCast2D
#onready var conversar := $talk_raycast as RayCast2D
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

var is_grounded = false
var in_interact_range
onready var raycasts = $raycasts

func _physics_process(delta):
	MAX_SPEED = ParametrosGlobais.MAX_SPEED
	JUMP_HEIGHT = ParametrosGlobais.JUMP_HEIGHT
	
	var friction = false
	direction.x = Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	
	if(direction.x!=0):
		last_dir = direction.x
		isWall.scale.x = direction.x
		$talk_raycast.scale.x = direction.x
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
	
	#is_grounded = _check_is_grounded()
	in_interact_range = _check_in_interact()

	motion = move_and_slide(motion, UP)
	atualiza_inventario()
	pass

func _input(event):
	if event.is_action_pressed("jump") and is_grounded:
		motion.y = JUMP_HEIGHT/2
		
	if event.is_action_pressed("interact") and in_interact_range:
		var talk_collider = $talk_raycast.get_collider()
		talk_collider._interact_talk()

##acho que a gente não precisa disso?
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

func _on_interacted(): #roupa
	ParametrosGlobais.add_roupa()
	if(ParametrosGlobais.qtde_roupa==3): ParametrosGlobais.MAX_SPEED -= 20
	if(ParametrosGlobais.qtde_roupa==4): ParametrosGlobais.MAX_SPEED -= 20
	print(ParametrosGlobais.qtde_roupa)

func _on_food_interacted():
	ParametrosGlobais.add_comida()
	if(ParametrosGlobais.qtde_comida==0): ParametrosGlobais.JUMP_HEIGHT += 20
	else: ParametrosGlobais.MAX_SPEED -= 5
	print(ParametrosGlobais.qtde_comida)

func _on_money_bag_interacted():
	ParametrosGlobais.add_dinheiro()
	print(ParametrosGlobais.qtde_dinheiro)
	
func atualiza_inventario():
	if(ParametrosGlobais.qtde_roupa>=1): 
		$inventario/camisa_slot/Camisa.visible=true
		$inventario/camisa_slot/qtde_camisa.visible=true
	$inventario/camisa_slot/qtde_camisa.text="x"+str(ParametrosGlobais.qtde_roupa)
	if(ParametrosGlobais.qtde_comida>=1): 
		$inventario/comida_slot/Comida.visible=true
		$inventario/comida_slot/qtde_comida.visible=true
	$inventario/comida_slot/qtde_comida.text="x"+str(ParametrosGlobais.qtde_comida)
	if(ParametrosGlobais.qtde_dinheiro>=1): 
		$inventario/dinheiro_slot/Dinheiro.visible=true
		$inventario/dinheiro_slot/qtde_dinheiro.visible=true
	$inventario/dinheiro_slot/qtde_dinheiro.text="x"+str(ParametrosGlobais.qtde_dinheiro)
