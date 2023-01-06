extends Node

# Level variables
export (Array, int) var current_level_and_sublevel
var current_word
var current_answer

# Signals
signal set_current_word
signal current_level_and_sublevel

# Consts
const WORDS = [
	[["bo", "la"], ["jo", "go"], ["sol"]], # Level 1
	[["pai"], ["te", "sou", "ro"], ["flor"]], # Level 2
	[["mo", "chi", "la"], ["sa", "ú", "de"], ["i", "de", "ias"]] # Level 3
]

func _ready():
	setup()

func setup():
	var current_level = current_level_and_sublevel[0]
	var current_sublevel = current_level_and_sublevel[1]
	
	current_word = PoolStringArray(WORDS[current_level-1][current_sublevel-1]).join("")
	
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
	emit_signal("set_current_word", current_word)		
