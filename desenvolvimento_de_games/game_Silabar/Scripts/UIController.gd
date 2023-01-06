extends Node

onready var level_label = $"./Nível"

func _on_GameManager_current_level_and_sublevel(new_level_and_sublevel):
	if(!level_label):
		level_label = $"../Nível"

	level_label.set_text("Nível %d" % [new_level_and_sublevel[0]])
	pass # Replace with function body.
