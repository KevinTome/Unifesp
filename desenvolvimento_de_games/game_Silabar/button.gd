extends Button

onready var drop_target = get_node("../TargetContainer/Padding/TargetContainer")

func _ready():
	$".".connect("pressed", self, "_button_pressed")
	#$"../TargetContainer/StaticBody2D/CollisionShape2D".disabled(false)
	

func _button_pressed():
	var txt=''
	for _i in drop_target.get_children():
		#print(_i)
		print(_i.label)
		txt+=_i.label
	print("Ordem do texto: " + txt)
	if(txt=="BO-LA"):
		print("VocÊ acertou!")
		#$"../TargetContainer/StaticBody2D/CollisionShape2D".disabled(true)
		
