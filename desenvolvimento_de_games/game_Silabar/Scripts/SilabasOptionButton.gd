extends OptionButton

func _on_GameManager_set_current_word(current_word):
	print("uepa", current_word)
	
	for i in len(current_word):
		self.add_item((str(i+1) + " Sílabas"), i)
