extends Panel


onready var txt_container = $MarginContainer
onready var label_start = $MarginContainer/MarginContainer/HBoxContainer/start
onready var label_end = $MarginContainer/MarginContainer/HBoxContainer/end
onready var label_txt = $MarginContainer/MarginContainer/HBoxContainer/Label

export(String, MULTILINE) var Texto : String

const CHAR_READ_RATE = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
	#hide()

func hide():
	label_start = ""
	label_end = ""
	label_txt.text = ""
	txt_container.hide()
	
func show():
	label_start = "''"
	label_end = "''"
	txt_container.show()

func add_text(texto):
	label_txt.text = texto
	show()
	$Tween.interpolate_property(label_txt, "percent_visible",0.0,1.0, len(texto)*CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Area2D_body_entered(body):
	add_text(Texto)

#"Boas vindas, pessoa perdida! \nMe chamo Lu, e eu vou te ajudar a achar o caminho de volta para casa. \nMova-se para cá! (teclas A/D)"
func _on_Area2D_body_exited(body):
	hide()
