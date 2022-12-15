extends Node2D

onready var StreamPlayers = get_children()

func play_audio(audio_name):
	
	for audio in StreamPlayers:
		if audio.name == audio_name:
			var node = audio
			node.play()
			break
		else:
			print("Audio nao encontrado...")
