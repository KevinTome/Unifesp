extends Control

onready var audio_player = $AudioPlayer_Override

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player.play_audio("mus_menu");

func _on_StartButton_pressed():
	get_tree().change_scene("res://tela01.tscn");


func _on_ExitButton_pressed():
	get_tree().finish();


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn");
