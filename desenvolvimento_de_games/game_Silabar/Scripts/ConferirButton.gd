extends Button

signal btn_saltar_pressed()
signal check_answer

func _on_Conferir_pressed():
	print(self.name)
	if(self.name == "menu"):
		get_tree().change_scene("res://Scenes/Menu.tscn")
	emit_signal("check_answer")
	emit_signal("btn_saltar_pressed")
