extends Button

onready var drop_target = get_node("../UmaSilaba/ContainerAlvo_1_silaba")
onready var drop_target_2a = get_node("../DuasSilabas/TargetContainer2/ContainerAlvo_2_silabas_a")
onready var drop_target_2b = get_node("../DuasSilabas/TargetContainer3/ContainerAlvo_2_silabas_b")

onready var c01 = get_node("../UmaSilaba/StaticBody2D/CollisionShape2D")
onready var c02a = get_node("../DuasSilabas/TargetContainer2/StaticBody2D/CollisionShape2D")
onready var c02b = get_node("../DuasSilabas/TargetContainer3/StaticBody2D/CollisionShape2D")
onready var c03a = get_node("../TresSilabas/StaticBody2D/CollisionShape2D")

signal btn_saltar_pressed()

func _ready():
	$".".connect("pressed", self, "_button_pressed")
	#$"../TargetContainer/StaticBody2D/CollisionShape2D".disabled(false)
	

func _button_pressed():
	var txt=''
	var id = $"../Opt_Silabas".get_selected_id() 
	
	var btnlabel = $".".name
	if(btnlabel == "Reiniciar"):
		get_tree().reload_current_scene()
	
	var nivel = get_tree().current_scene.filename
	if(btnlabel == "Conferir"):
		if(nivel == "res://Niveis/nivel1_fase1.tscn"):
			_conferir_nivel_1_fase_1(btnlabel, id)
		if(nivel == "res://Niveis/nivel1_fase2.tscn"):
			_conferir_nivel_1_fase_2(btnlabel, id)
	

func _conferir_nivel_1_fase_1(btnlabel, id):
	if(id == 0):
		#Usuário utilizou apenas uma sílaba
		#c01.disabled=false#ativa a colision para 1 silaba
		pass

	if(id==1):
		#Usuário utilizou duas sílabas
		var s01 = ''
		var s02 = ''
		
		for _i in drop_target_2a.get_children():
			print(_i.label)
			s01+=_i.label
	
		for _i in drop_target_2b.get_children():
			#print(_i)
			print(_i.label)
			s02+=_i.label
			
		print("s1: " + s01)
		print("s2: " + s02)
		
		if(s01 == "BO" && s02 == "LA"):
			#usuário acertou
			c02a.disabled = false
			c02b.disabled = false
			
			
	if(id == 2):
		#Usuário utilizou três sílabas
		#c03a.disabled=false #Ativa a colision pra 3 silabas
		pass
		
	emit_signal("btn_saltar_pressed")


func _conferir_nivel_1_fase_2(btnlabel, id):
	if(id == 0):
		#Usuário utilizou apenas uma sílaba
		#c01.disabled=false#ativa a colision para 1 silaba
		pass

	if(id==1):
		#Usuário utilizou duas sílabas
		var s01 = ''
		var s02 = ''
		
		for _i in drop_target_2a.get_children():
			print(_i.label)
			s01+=_i.label
	
		for _i in drop_target_2b.get_children():
			#print(_i)
			print(_i.label)
			s02+=_i.label
			
		print("s1: " + s01)
		print("s2: " + s02)
		
		if(s01 == "JO" && s02 == "GO"):
			#usuário acertou
			c02a.disabled = false
			c02b.disabled = false
			
			
	if(id == 2):
		#Usuário utilizou três sílabas
		#c03a.disabled=false #Ativa a colision pra 3 silabas
		pass
		
	emit_signal("btn_saltar_pressed")
