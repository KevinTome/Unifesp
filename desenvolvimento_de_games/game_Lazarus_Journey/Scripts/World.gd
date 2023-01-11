extends Node

onready var audio_player = $AudioPlayerMenager

func _ready():
	audio_player.play_audio("mus_menu")
