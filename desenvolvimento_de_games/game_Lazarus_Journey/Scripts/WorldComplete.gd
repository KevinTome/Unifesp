extends Area2D

export(String, FILE, "*.tscn") var next_world

onready var AP = $AnimationPlayer
var playing = false

func _physics_process(delta):
	if(!playing):
		print("play lu")
		AP.play("Lu_Idle")
		playing = true
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player2":
			print("uepa")
			print(next_world)
			get_tree().change_scene(next_world)
