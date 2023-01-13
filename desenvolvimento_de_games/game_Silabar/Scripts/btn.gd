extends TextureButton

func _ready():
	$".".connect("pressed", self, "_button_pressed")

func _button_pressed():
	var txt= $".".name
	print("Botão " + txt)
	
	match txt:
		"QuitButton":
			get_tree().quit()
		"PlayButton":
			get_tree().change_scene("res://Scenes/InGame.tscn")			
		"CreditsButton":
			get_tree().change_scene("res://Scenes/Credits.tscn")
