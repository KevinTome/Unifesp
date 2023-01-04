extends Node2D

onready var dropdown = get_node("Opt_Silabas")

onready var tc01 = get_node("UmaSilaba")
onready var tc02 = get_node("DuasSilabas")
onready var tc03 = get_node("TresSilabas")


onready var audio_player = $AudioPlayer_

func _ready():
	

	audio_player.play_audio("mus_gameplay")
	dropdown.add_item("1 sílaba", 0)
	dropdown.add_item("2 sílabas", 1)
	dropdown.add_item("3 sílabas", 2)
	
	tc03.visible = false
	tc02.visible = false
	tc01.visible = true	
	
	$UmaSilaba/StaticBody2D/CollisionShape2D.disabled= true
	$DuasSilabas/TargetContainer2/StaticBody2D/CollisionShape2D.disabled= true 
	$DuasSilabas/TargetContainer3/StaticBody2D/CollisionShape2D.disabled= true
	$DuasSilabas.rect_size = Vector2(700,100)
	#x -- 50% 
	#730 -- 100%
	# x = 50*730 / 100
	
	$DuasSilabas/TargetContainer2.rect_min_size=Vector2(730*45/100,100)
	$DuasSilabas/TargetContainer3.rect_min_size=Vector2(730*45/100,100)
	
	$DuasSilabas.add_constant_override("separation", 50)
	
	$DuasSilabas.visible = false
	##$".".add_item("3 sílaba", 2)
func _on_OptionButton_item_selected(index):
	if(index == 1):
		print("Selecionado: 2 silabas")
		tc01.visible = false	
		tc02.visible = true
		tc03.visible = false	
		
	if(index == 0):
		print("Selecionado: 1 silabas")
		tc02.visible = false
		tc01.visible = true	
		tc03.visible = false	
		
	if(index == 2):
		print("Selecionado: 3 silabas")
		tc02.visible = false
		tc01.visible = false
		tc03.visible = true	

func _input(event):
	if event.is_action_pressed("ui_left"):
	   print("Clicou")


func _on_Personagem_saiu_da_tela():
	
	pass # Replace with function body.
