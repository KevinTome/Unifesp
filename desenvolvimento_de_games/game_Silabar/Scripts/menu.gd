extends Node2D

onready var audio_player = $AudioPlayer_Override

func _ready():
	audio_player.play_audio("mus_menu")
