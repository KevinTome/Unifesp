.data
	#ENTRADA
	String: .space 1024
	
	#TESTE
	Teste: .asciiz "Oi, desculpe por não te ligar hoje às 8:00. Estava muito frio e não te encontrei em casa."
	Teste1: .asciiz "Oi, desculpe amorzao"

	#SAIDA
	TotalCaracteres: .asciiz "Número total de caracteres: "
	TotalPalavras: .asciiz "Número total de palavras: "
	PalavrasRepitidas: .asciiz "Palavras repitidas: "
	
	#CONSTANTES
	Espaco: .ascii  " "
	Vazio: .ascii "\n"
.text

 _main: 	
	#INDEX
	#  t0 -> iterador e contador de letras
	#  t1 -> string	
	#  t2 -> char atual
	#  t3 -> espaço \n
	#  t4 -> contador de espaços
	addi $t0, $t0, 0
	addi $t3, $t3, 0
	addi $t4, $t4, 0
	lb $a2, Vazio
	lb $a3, Espaco
		
	li $v0, 8 #leitura do nome do produto
	la $a0, String
	la $a1, 1024
	syscall 
	move $t1, $a0 

loop:
	lb $t2, String($t0)
	
	beq $t2, $a2, saida_loop
	beq $t2, $a3, contador_espaco
	
	addi $t0, $t0, 1
	j loop
	
contador_espaco:
	addi $t4, $t4, 1
	addi $t0, $t0, 1
	
	j loop
	
saida_loop:

	li $v0, 4  			#Printar uma string
	la $a0, TotalCaracteres
	syscall 
	
	li $v0, 1			#Printar o numero de chars
	move $a0, $t0
	syscall
	
	li $v0, 4 			#printar \n
	la $a0, Vazio
	syscall 
	
	li $v0, 4  			#Printar uma string
	la $a0, TotalPalavras
	syscall 
	
	li $v0, 1			#Printar o numero de palavras
	addi $a0, $t4, 1
	syscall
	
	li $v0, 10
	syscall 
	
	
