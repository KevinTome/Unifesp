extends Node
	
"""onready var wordsList = {
	"level1": [
			{ "id": 1, "word": ["bo", "la"]},
			{ "id": 2, "word": ["es", "to", "jo"]}
		],
	"level2": [
			{ "id": 2, "word": ["car", "ro"]},
			{ "id": 3, "word": ["prin", "ce", "sa"]}
		],
	"level3": [
			{ "id": 4, "word": ["a", "tle", "ta"]},
			{ "id": 5, "word": ["di", "cio", "na", "rio"]}
		]
}
	
onready	var wordsDone = []
onready	var currentLevel = 1;"""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	"""var currentWordsList = wordsList.currentLevel
	
	randomize()
	currentWordsList.shuffle()
	
	var randomWord = currentWordsList[0];
	var j = 0
	while (wordsDone.find(randomWord.id) == -1):
		randomWord = currentWordsList[j]
		j = j+1

	var wholeWord = PoolStringArray(randomWord.word).join("")
	var dragables2 = []	
	
	for i in len(wholeWord):
		dragables2[i].id = (i+1)
		dragables2[i].label = wholeWord[i]"""
