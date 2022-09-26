.data
	#Perguntas
	PerguntaHoras: .asciiz "Entre com as horas: "
	PerguntaMinutos: .asciiz "Entre com os minutos: "
	PerguntaSegundos: .asciiz "Entre com os segundos: "
	DoisPontos: .asciiz ":"
	
	#Valor Invalido
	ViHoras: .asciiz "Valor inválido para as horas. Esperado número entre 0 e 23."
	ViMinutos: .asciiz "Valor inválido para os minutos. Esperado número entre 0 e 59."
	ViSegundos: .asciiz "Valor inválido para os segundos. Esperado número entre 0 e 59."
	
	#Mensagem final
	Msg: .asciiz "Horário digitado: "
	
.text
		
	Horas:
		li $v0, 4 #printar uma string
		la $a0, PerguntaHoras
		syscall 
	
		li $v0, 5 #leitura das horas do usuario
		syscall 
	
		blt $v0, 0, HorasVi
		bgt $v0, 23, HorasVi
		
		move $t0, $v0
		blt $v0, 23, Minutos
			
	HorasVi:
		li $v0, 4 #printar uma string
		la $a0, ViHoras
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaHoras
		syscall 
	
		li $v0, 5 #leitura das horas do usuario
		syscall 
	
		blt $v0, 0, HorasVi
		bgt $v0, 23, HorasVi
		
		move $t0, $v0
		blt $v0, 23, Minutos
			
 	Minutos:	
		li $v0, 4 
		la $a0, PerguntaMinutos
		syscall
	
		li $v0, 5 #leitura das horas do usuario
		syscall 
	
		blt $v0, 0, MinutosVi
		bgt $v0, 59 , MinutosVi
	
		move $t1, $v0
		blt $v0, 59, Segundos
	
	MinutosVi:
		li $v0, 4 #printar uma string
		la $a0, ViMinutos
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaMinutos
		syscall 
	
		li $v0, 5 #leitura das horas do usuario
		syscall 
	
		blt $v0, 0, MinutosVi
		bgt $v0, 59, MinutosVi
		
		move $t1, $v0
		blt $v0, 59, Segundos
	
	Segundos: 
		li $v0, 4 
		la $a0, PerguntaSegundos
		syscall
	
		li $v0, 5 #leitura das horas do usuario
		syscall 
	
		blt $v0, 0, SegundosVi
		bgt $v0, 59 , SegundosVi
		
		move $t2, $v0
		blt $v0, 59, PrintFinal
		
	SegundosVi:
		li $v0, 4 #printar uma string
		la $a0, ViSegundos
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaSegundos
		syscall 
	
		li $v0, 5 #leitura das horas do usuario
		syscall 
	
		blt $v0, 0, SegundosVi
		bgt $v0, 59, SegundosVi
		
		move $t2, $v0
		blt $v0, 59, PrintFinal
	
	PrintFinal:
		li $v0, 4 #printar uma string
		la $a0, Msg
		syscall
	
		li $v0, 1
		move $a0, $t0
		syscall 
	
		li $v0, 4 #printar uma string
		la $a0, DoisPontos
		syscall
	
		li $v0, 1
		move $a0, $t1
		syscall 
	
		li $v0, 4 #printar uma string
		la $a0, DoisPontos
		syscall
	
		li $v0, 1
		move $a0, $t2
		syscall 
	
	
	
	 
