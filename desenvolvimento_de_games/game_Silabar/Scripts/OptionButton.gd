extends Node2D

onready var dropdown = get_node("OptionButton")
onready var tc01 = get_node("TargetContainer")
onready var tc02 = get_node("HBoxContainer")
onready var audio_player = $AudioPlayer_

func _ready():
	audio_player.play_audio("mus_gameplay")
	dropdown.add_item("1 sílaba", 0)
	dropdown.add_item("2 sílaba", 1)
	tc02.visible = false
	tc01.visible = true	
	
	$HBoxContainer.rect_size = Vector2(700,100)
	#x -- 50% 
	#730 -- 100%
	# x = 50*730 / 100
	
	$HBoxContainer/TargetContainer2.rect_min_size=Vector2(730*45/100,100)
	$HBoxContainer/TargetContainer3.rect_min_size=Vector2(730*45/100,100)
	
	$HBoxContainer.add_constant_override("separation", 50)
	
	$HBoxContainer.visible = false
	##$".".add_item("3 sílaba", 2)
func _on_OptionButton_item_selected(index):
	if(index == 1):
		print("Selecionado: 2 silabas")
		tc01.visible = false	
		tc02.visible = true
		
	else:
		print("Selecionado: 1 silabas")
		tc02.visible = false
		tc01.visible = true	

func _input(event):
	if event.is_action_pressed("ui_left"):
	   print("Clicou")
