extends Node2D

onready var audio_player = $AudioPlayerMenager

func _ready():
	#audio_player.play_audio("ambience_oscampos")
	audio_player.play_audio("mus_gameplay_oscampos")


func _on_interacted():
	pass # Replace with function body.
