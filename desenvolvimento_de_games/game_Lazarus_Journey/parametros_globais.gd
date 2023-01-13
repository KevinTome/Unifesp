extends Node

var MAX_SPEED = 250
var JUMP_HEIGHT = -500
var qtde_roupa = 0
var qtde_comida = 0 
var qtde_dinheiro = 5 


var pontos = 0

var titulo
var badending = false

func add_roupa():
	qtde_roupa=qtde_roupa+1

func add_comida():
	qtde_comida+=1

func add_dinheiro():
	qtde_dinheiro+=1
	
func total_pts():
	pontos = qtde_comida + qtde_dinheiro + qtde_roupa

func set_titulo():
	total_pts()
	if (ParametrosGlobais.pontos>=0 && ParametrosGlobais.pontos<=4): badending = false
	else: badending = true
	
	if (ParametrosGlobais.pontos==0): titulo = "Abençoado"
	if (ParametrosGlobais.pontos>0 && ParametrosGlobais.pontos<=4): titulo = "Bondoso"
	if (ParametrosGlobais.pontos>4 && ParametrosGlobais.pontos<=9): titulo = "Pecador"
	if (ParametrosGlobais.pontos>9 && ParametrosGlobais.pontos<=14): titulo = "Maldoso"
	if (ParametrosGlobais.pontos==15): titulo = "Perverso"
