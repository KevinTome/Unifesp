extends Button

signal btn_saltar_pressed()
signal check_answer

func _on_Conferir_pressed():
	emit_signal("check_answer")
	emit_signal("btn_saltar_pressed")
