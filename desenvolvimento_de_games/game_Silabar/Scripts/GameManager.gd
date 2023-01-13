extends Node

# Level variables
export (Array, int) var current_level_and_sublevel
#var current_word
#var current_answer

# Signals
signal set_current_word
signal current_level_and_sublevel

# Consts
const WORDS = [
	[["bo", "la"], ["pé"], ["jo", "go"], ["sol"]], # Level 1
	[["pai"], ["te", "sou", "ro"], ["flor"]], # Level 2
	[["mo", "chi", "la"], ["sa", "ú", "de"], ["i", "dei", "as"]] # Level 3
]

func _ready():
	setup()

func setup():
	var current_level = current_level_and_sublevel[0]
	var current_sublevel = current_level_and_sublevel[1]
	
	var current_word = PoolStringArray(WORDS[current_level-1][current_sublevel-1]).join("")
	
	emit_signal("current_level_and_sublevel", current_level_and_sublevel)
	emit_signal("set_current_word", current_word)


func _on_Conferir_correct_answer():
	var new_level = current_level_and_sublevel[0]
	var new_sublevel = current_level_and_sublevel[1]
	
	if(new_sublevel == len(WORDS[new_level-1])):
		new_level = new_level + 1
		new_sublevel = 0
	else:
		new_sublevel = new_sublevel + 1
			
	current_level_and_sublevel = [new_level, new_sublevel]
	var new_word = PoolStringArray(WORDS[new_level-1][new_sublevel-1]).join("")
		
	emit_signal("current_level_and_sublevel", current_level_and_sublevel)
	emit_signal("set_current_word", new_word)		
	
func next_level():
	var new_level = current_level_and_sublevel[0]
	var new_sublevel = current_level_and_sublevel[1]
	
	if(new_sublevel == len(WORDS[new_level-1])):
		if(new_level == len(WORDS)):
			get_tree().change_scene("res://Scenes/Win.tscn")
			return

		new_level = new_level + 1
		new_sublevel = 1
	else:
		new_sublevel = new_sublevel + 1
			
	current_level_and_sublevel = [new_level, new_sublevel]
	var new_word = PoolStringArray(WORDS[new_level-1][new_sublevel-1]).join("")
		
	emit_signal("current_level_and_sublevel", current_level_and_sublevel)
	emit_signal("set_current_word", new_word)			

func _on_Conferir_check_answer():
	var answer = []
	
	for target_control in self.get_parent().get_node("TargetArea").get_children():
		answer.push_back([""])
		for draggable in target_control.get_node("TargetContainer").get_children():
			answer[target_control.get_node("TargetContainer").id].push_back(draggable.label)
		answer[target_control.get_node("TargetContainer").id] = PoolStringArray(answer[target_control.get_node("TargetContainer").id]).join("")
			
	var current_level = current_level_and_sublevel[0]
	var current_sublevel = current_level_and_sublevel[1]
	var current_word = WORDS[current_level-1][current_sublevel-1]
	
	if(len(current_word) != len(answer)):
		return false
	
	for i in range(0, answer.size()):
		if(answer[i].to_lower() != current_word[i]):
			return false
		
	self.get_parent().get_node("Area2D/CollisionShape2D").disabled = false
	


func _on_Personagem_win_animation_ended():
	next_level()
	
	self.get_parent().get_node("TargetArea")._ready()
	self.get_parent().get_node("DragContainer")._populate_dragables()
	self.get_parent().get_node("Area2D/CollisionShape2D").disabled = true
