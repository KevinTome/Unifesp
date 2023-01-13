extends Area2D

export(String, FILE, "*.tscn") var next_world

onready var AP = $AnimationPlayer
var playing = false

var readyto_interact

func _physics_process(delta):
	if(get_tree().current_scene.filename=="res://Scenes/fase07_finalização.tscn"):
		ParametrosGlobais.set_titulo()
		if(ParametrosGlobais.badending): 
			AP.play("Lu_evil")
			next_world = "res://Scenes/badending.tscn"
		else:
			next_world = "res://Scenes/goodending.tscn"
		
	if(!playing):
		print("play lu")
		AP.play("Lu_Idle")
		playing = true
	#var bodies = get_overlapping_bodies()
	#for body in bodies:
	#	if body.name == "Player2":
	#		print("uepa")
	#		print(next_world)
	#		get_tree().change_scene(next_world)	
	
func _input(event):
	if event.is_action_pressed("interact") and readyto_interact:
		
			
		queue_free()
		emit_signal("interacted")
		print("uepa")
		print(next_world)
		get_tree().change_scene(next_world)	
			

func _on_WorldComplete_body_entered(body):
	readyto_interact = true

func _on_WorldComplete_body_exited(body):
	readyto_interact = false
