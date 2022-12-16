extends Button

func _ready():
	$".".connect("pressed", self, "_button_pressed")

func _button_pressed():
	var txt= $".".text
	print("Botão " + txt)
	
	match txt:
		"Sair":
			get_tree().quit()
		"Começar":
			get_tree().change_scene("res://tela01.tscn")			
		"Creditos":
			print("Fazer tela de creditos")
