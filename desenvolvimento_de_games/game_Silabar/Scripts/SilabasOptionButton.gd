extends OptionButton

func _on_GameManager_set_current_word(current_word):
	self.clear()
	
	for i in 4:
		self.add_item((str(i+1) + " Sílabas"), i)
