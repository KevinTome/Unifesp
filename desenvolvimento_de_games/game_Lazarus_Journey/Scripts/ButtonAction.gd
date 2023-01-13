extends TextureButton

export(String, "play", "credits", "quit") var button_action

const scenes_dict = {
	"play": "res://Scenes/fase01_limbo.tscn",
	"credits": ""
}

func _ready():
	$".".connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	if(self.button_action == "quit"):
		get_tree().quit()
		return
	
	get_tree().change_scene(scenes_dict[self.button_action])		
	
