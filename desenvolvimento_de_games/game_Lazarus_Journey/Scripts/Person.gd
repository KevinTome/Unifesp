extends RigidBody2D

var already_interacted = false

onready var pos = position

var observador_flag = false
var violenta_flag = 10


func _process(delta):
	move()

func _ready(): 
	$text.visible = false
	$collision.disabled = false
	
func _interact_talk():
	if($".".name == "violenta" || $".".name == "violentada" || $".".name == "observador"):
		if($".".name == "observador" && ParametrosGlobais.qtde_dinheiro >= 4):
			$collision.disabled = true
			observador_flag = true
			
		if($".".name == "violenta" && violenta_flag>0):
			violenta_flag-=1
		if($".".name == "violenta" && violenta_flag<=0):
			$collision.disabled = true
	else:
		already_interacted = true
		$collision.disabled = true
		ParametrosGlobais.add_incomodar()
		print("colisão desativada")
	

func _on_interact_range_body_entered(body):
	if !already_interacted:
		$text.visible = true
	
	print($".".name, body.name)
	if(body.name != $".".name):
		if (body.name == "observador" || body.name == "violenta"):
			$".".visible = false
			body.visible = false
			$".".get_parent().remove_child(body)

func _on_interact_range_body_exited(body):
	$text.visible = false

func move():
	if($".".name == "violenta" || $".".name == "violentada" || $".".name == "observador"):
		if($".".name == "observador" && observador_flag == true):
			pos += Vector2(0.8,0.3)
	else:
		pos += Vector2(0.15,0)
	
	set_position(pos)
