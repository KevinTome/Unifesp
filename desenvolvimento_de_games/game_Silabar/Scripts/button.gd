extends Button

onready var drop_target = get_node("../TargetContainer/Padding/TargetContainer_01")
onready var drop_target2a = get_node("../HBoxContainer/TargetContainer2/Padding/TargetContainer_02a")
onready var drop_target2b = get_node("../HBoxContainer/TargetContainer3/Padding/TargetContainer_02b")
onready var c02a = get_node("../HBoxContainer/TargetContainer2/StaticBody2D/CollisionShape2D")
onready var c02b = get_node("../HBoxContainer/TargetContainer3/StaticBody2D/CollisionShape2D")

func _ready():
	$".".connect("pressed", self, "_button_pressed")
	#$"../TargetContainer/StaticBody2D/CollisionShape2D".disabled(false)
	

func _button_pressed():
	var txt=''
	var id = $"../OptionButton".get_selected_id() 
	var btnlabel = $".".text
	
	if(btnlabel == "Conferir"):
		if(id == 0):
			#sílaba única
			print("silaba1")

		if(id==1):	#duas silabas
			var s01 = ''
			var s02 = ''
			for _i in drop_target2a.get_children():
				print(_i.label)
				s01+=_i.label
		
			for _i in drop_target2b.get_children():
				#print(_i)
				print(_i.label)
				s02+=_i.label
			print("s1: " + s01)
			print("s2: " + s02)
			
			if(s01 == "BO" && s02 == "LA"):
				print("Acertou")
				c02a.disabled = false
				c02b.disabled = false
	if(btnlabel == "Reiniciar"):
		get_tree().reload_current_scene()
		
