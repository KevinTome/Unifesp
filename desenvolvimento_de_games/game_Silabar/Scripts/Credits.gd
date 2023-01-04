extends Control

onready var audio_player = $AudioPlayer_Override

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player.play_audio("mus_credit")

func _on_BackButton_pressed():
	get_tree().change_scene("res://menu.tscn")
