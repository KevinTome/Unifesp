extends KinematicBody2D

const GRAVITY = 1200.0
const WALK_SPEED = 400
var wait_timer

var velocity = Vector2()

var btn_pressed = false

signal saiu_da_tela()
signal win_animation_ended

func _wait(s):
	if wait_timer.time_left <= 0.0:
		wait_timer = get_tree().create_timer(s)
		yield(wait_timer, "timeout")
		btn_pressed = false
		self.position = Vector2(-132, 292.996)
		emit_signal("win_animation_ended")		

func _physics_process(delta):
	var pos_y = $".".get_position()[1]
	var pos_x = $".".get_position()[0]
	
	if(pos_y>=1000):
		btn_pressed = false
		self.position = Vector2(-132, 292.996)
	
	if(!is_on_floor()):
			velocity.y += delta * 1.5 *GRAVITY	
	
	if(btn_pressed):
		var total_silabas = self.get_parent().get_node("SilabasOptionButton").get_selected_id() + 1
		
		if(!is_on_floor()):
			velocity.y += delta * 1.5 *GRAVITY	
		else:
			velocity.y = -1.2*WALK_SPEED*(3)

		if(pos_x >= 1000):
			velocity.x = 0
			_wait(2)

		else:
			if total_silabas == 1:
				velocity.x =  700
			elif total_silabas == 2:
				velocity.x =  500
			elif total_silabas == 3:
				velocity.x =  380
			else:
				velocity.x =  300	
			
		get_node("AnimatedSprite").set_flip_h(true)

		move_and_slide(velocity, Vector2(0, -1))

func _ready():
	wait_timer = get_tree().create_timer(0.0)

func _on_Conferir_btn_saltar_pressed():
	btn_pressed = true

				
