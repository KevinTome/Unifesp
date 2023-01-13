extends Node

var MAX_SPEED = 250
var JUMP_HEIGHT = -500
var qtde_roupa = 0
var qtde_comida = 0 
var qtde_dinheiro = 0 
var qtde_incomodo = 0
var acao_violenta = 1

var pontos = 0

var titulo
var adjetivos = "Você foi "
var badending = false

var atrib_oscampos = ["Resiliente, ", "Pouco luxurioso, ", "Luxurioso, ", "Extremamente luxurioso"]
var atrib_opantano = ["desconfiado, ", "composturado, ", "pouco guloso, ", "guloso, ", "extremamente guloso, "]
var atrib_asmontanhas = ["paranóico, ", "humilde, ", "pouco ganancioso, ", "ganancioso, ", "extremamente ganancioso"]
var atrib_oslagos = ["paciente ", "pouco raivoso ", "raivoso ", "extremamente raivoso "]
var atrib_asflorestas = ["e pacífico, ", "e um pouco violento.", "e violento.", "e extremamente violento"]

func add_roupa():
	qtde_roupa=qtde_roupa+1
	
func add_comida():
	qtde_comida+=1	

func add_dinheiro():
	qtde_dinheiro+=1
	
func add_incomodar():
	qtde_incomodo = 2
	
func add_acao_violenta(acao):
	acao_violenta = acao

func get_adjetivos():
	#Adjetivos do desafio de luxuria
	adjetivos = adjetivos + atrib_oscampos[qtde_roupa]
	#Adjetivos do desafio de gula
	if(qtde_comida <= 3):
		adjetivos = adjetivos + atrib_opantano[0]
	else:
		adjetivos = adjetivos + atrib_opantano[qtde_comida-3]
	#Adjetivos do desafio de ganancia		
	adjetivos = adjetivos + atrib_asmontanhas[qtde_dinheiro]
	#Adjetivos do desafio de raiva	
	adjetivos = adjetivos + atrib_oslagos[qtde_incomodo]
	#Adjetivos do desafio de violencia	
	adjetivos = adjetivos + atrib_asflorestas[acao_violenta]
	print(adjetivos)	
	
	
func total_pts():
	pontos = qtde_comida + qtde_dinheiro + qtde_roupa + qtde_incomodo + acao_violenta	

func set_titulo():
	total_pts()
	if (ParametrosGlobais.pontos>=0 && ParametrosGlobais.pontos<=4): badending = false
	else: badending = true
	
	if (ParametrosGlobais.pontos==0): titulo = "Abençoado"
	if (ParametrosGlobais.pontos>0 && ParametrosGlobais.pontos<=4): titulo = "Bondoso"
	if (ParametrosGlobais.pontos>4 && ParametrosGlobais.pontos<=9): titulo = "Pecador"
	if (ParametrosGlobais.pontos>9 && ParametrosGlobais.pontos<=14): titulo = "Maldoso"
	if (ParametrosGlobais.pontos==15): titulo = "Perverso"
