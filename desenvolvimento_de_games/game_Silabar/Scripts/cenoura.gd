extends KinematicBody2D

const GRAVITY = 1200.0
const WALK_SPEED = 400
var wait_timer

var velocity = Vector2()

var btn_pressed = false

signal saiu_da_tela()

func _wait(s):
	if wait_timer.time_left <= 0.0:
		wait_timer = get_tree().create_timer(s)
		print("Esperando...")
		yield(wait_timer, "timeout")
		prox_fase()
		print("pronto...")

func _physics_process(delta):
	var pos_y = $".".get_position()[1]
	var pos_x = $".".get_position()[0]
	
	
	if(pos_y>=1000):
		get_tree().reload_current_scene()
	
	if(!is_on_floor()):
			velocity.y += delta * 1.5 *GRAVITY	
	
	if(btn_pressed):
		if(!is_on_floor()):
			velocity.y += delta * 1.5 *GRAVITY	
		else:
			velocity.y = -1.2*WALK_SPEED

		if(pos_x >= 1000):
			velocity.x = 0
			_wait(2)
			#print("Próxima fase")
		else:
			velocity.x =  WALK_SPEED
		get_node("AnimatedSprite").set_flip_h(true)

	move_and_slide(velocity, Vector2(0, -1))

func _ready():
	wait_timer = get_tree().create_timer(0.0)


func _on_Conferir_btn_saltar_pressed():
	btn_pressed = true


func prox_fase():
	var nivel = get_tree().current_scene.filename
	match (nivel):
		"res://Niveis/nivel1_fase1.tscn":
			get_tree().change_scene("res://Niveis/nivel1_fase2.tscn")
		"res://Niveis/nivel1_fase2.tscn":
			get_tree().change_scene("res://Niveis/nivel1_fase3.tscn")
		"res://Niveis/nivel1_fase3.tscn":
			get_tree().change_scene("res://Niveis/nivel2_fase1.tscn")
		"res://Niveis/nivel2_fase1.tscn":
			get_tree().change_scene("res://Niveis/nivel2_fase2.tscn")
		"res://Niveis/nivel2_fase2.tscn":
			get_tree().change_scene("res://Niveis/nivel2_fase3.tscn")
		"res://Niveis/nivel2_fase3.tscn":
			get_tree().change_scene("res://Niveis/nivel3_fase1.tscn")
		"res://Niveis/nivel3_fase1.tscn":
			get_tree().change_scene("res://Niveis/nivel3_fase2.tscn")
		"res://Niveis/nivel3_fase2.tscn":
			get_tree().change_scene("res://Niveis/nivel3_fase3.tscn")
		"res://Niveis/nivel3_fase3.tscn":
			pass
				
