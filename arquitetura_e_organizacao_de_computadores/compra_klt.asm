.data
	#Perguntas
	PerguntaNomeProduto: .asciiz "Digite o nome do produto: "
	PerguntaValorUnitario: .asciiz "Insira o valor unitário deste produto: "
	PerguntaQuantidade: .asciiz "Insira a quantidade desejada deste produto: "
	PerguntaNovoProduto: .asciiz "Deseja comprar algo a mais? Se sim, digite 1. Caso contrário, digite 0. Resposta: "
	
	#Respostas
	NomeProduto1: .space 20
	NomeProduto2: .space 20
	NomeProduto3: .space 20
	NomeProduto4: .space 20
	NomeProduto5: .space 20
	Zero: .float 0.0 
	
	#Mensagem final
	MsgPedido: .asciiz "Pedido: "
	MsgValorUnitario: .asciiz "Valor unitário: "
	MsgValorTotalProduto: .asciiz "Valor total do produto: "
	MsgValorTotal: .asciiz "Valor total do pedido: "
	MsgX: .asciiz " x "
	MsgVazio: .asciiz "\n"
	
.text
		#PRIMEIRO PRODUTO
		move $t0, $zero
		addi $t0, $t0, 1
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNomeProduto
		syscall 
		
		li $v0, 8 #leitura do nome do produto
		la $a0, NomeProduto1
		la $a1, 20
		syscall 
		move $a2, $a0 
			
		li $v0, 4 #printar uma string
		la $a0, PerguntaValorUnitario
		syscall 
		
		li $v0, 6 #leitura do valor unitario
		syscall
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f2, $f1, $f0
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaQuantidade
		syscall 
	
		li $v0, 5 #leitura da quantidade do produto
		syscall 
		
		move $t4, $v0
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNovoProduto
		syscall 
		
		li $v0, 5 #leitura int sim ou nao
		syscall 
		
		beqz $v0, CompraFinal1
		
		#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#
		#SEGUNDO PRODUTO
		addi $t0, $t0, 1
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNomeProduto
		syscall 
		
		li $v0, 8 #leitura do nome do produto
		la $a0, NomeProduto2
		la $a1, 20
		syscall 
		move $a3, $a0 
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaValorUnitario
		syscall 
		
		li $v0, 6 #leitura do valor unitario
		syscall
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f3, $f1, $f0 
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaQuantidade
		syscall 
	
		li $v0, 5 #leitura da quantidade do produto
		syscall 
		
		move $t5, $v0
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNovoProduto
		syscall 
		
		li $v0, 5 #leitura int sim ou nao
		syscall 
		
		beqz $v0, CompraFinal2
		
		#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#
		#TERCEIRO PRODUTO
		addi $t0, $t0, 1
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNomeProduto
		syscall 
		
		li $v0, 8 #leitura do nome do produto
		la $a0, NomeProduto3
		la $a1, 20
		syscall 
		move $t1, $a0
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaValorUnitario
		syscall 
		
		li $v0, 6 #leitura do valor unitario
		syscall
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f4, $f1, $f0
		
		li $v0, 2  #printar um float
		syscall  
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaQuantidade
		syscall 
	
		li $v0, 5 #leitura da quantidade do produto
		syscall 
		
		move $t6, $v0
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNovoProduto
		syscall 
		
		li $v0, 5 #leitura int sim ou nao
		syscall 
		
		beqz $v0, CompraFinal3
		
		#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#
		#QUARTO PRODUTO
		addi $t0, $t0, 1
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNomeProduto
		syscall 
		
		li $v0, 8 #leitura do nome do produto
		la $a0, NomeProduto4
		la $a1, 20
		syscall 
		move $t2, $a0 
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaValorUnitario
		syscall 
		
		li $v0, 6 #leitura do valor unitario
		syscall
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f5, $f1, $f0
		
		li $v0, 2  #printar um float
		syscall  
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaQuantidade
		syscall 
	
		li $v0, 5 #leitura da quantidade do produto
		syscall 
		
		move $t7, $v0
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNovoProduto
		syscall 
		
		li $v0, 5 #leitura int sim ou nao
		syscall 
		
		beqz $v0, CompraFinal4
	
		#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#	
		#QUINTO PRODUTO 
		addi $t0, $t0, 1
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaNomeProduto
		syscall 
		
		li $v0, 8 #leitura do nome do produto
		la $a0, NomeProduto5
		la $a1, 20
		syscall 
		move $t3, $a0
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaValorUnitario
		syscall 
		
		li $v0, 6 #leitura do valor unitario
		syscall
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f6, $f1, $f0
		
		li $v0, 2  #printar um float
		syscall  
		
		li $v0, 4 #printar uma string
		la $a0, PerguntaQuantidade
		syscall 
	
		li $v0, 5 #leitura da quantidade do produto
		syscall 
		
		move $t8, $v0
		
		j CompraFinal5
		
	#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	CompraFinal1: 
		li $v0, 4 #printar uma string
		la $a0, MsgPedido
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t4
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a2
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f2
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t4, $f8
		cvt.s.w $f8, $f8
		mul.s $f20, $f8, $f2
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f20
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotal
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f20
		li $v0, 2  #printar um floatt
		syscall
		
		j Finalizar
		
		#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#
		CompraFinal2: 
		li $v0, 4 #printar uma string
		la $a0, MsgPedido
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t4
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a2
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f2
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t4, $f8
		cvt.s.w $f8, $f8
		mul.s $f20, $f8, $f2
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f20
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t5
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a3
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f3
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t5, $f10
		cvt.s.w $f10, $f10
		mul.s $f22, $f10, $f3
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f22
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		##MENSAGEM FINAL 
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotal
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f9, $f7, $f22
		add.s $f12, $f1, $f9
		li $v0, 2  #printar um floatt
		syscall
		
		j Finalizar
		
		#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#
		CompraFinal3: 
		li $v0, 4 #printar uma string
		la $a0, MsgPedido
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t4
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a2
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f2
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t4, $f8
		cvt.s.w $f8, $f8
		mul.s $f20, $f8, $f2
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f20
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t5
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a3
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f3
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t5, $f10
		cvt.s.w $f10, $f10
		mul.s $f22, $f10, $f3
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f22
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t6
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $t1
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f4
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t6, $f14
		cvt.s.w $f14, $f14
		mul.s $f24, $f14, $f4
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f24
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		##MENSAGEM FINAL 
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotal
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f11, $f9, $f24
		add.s $f12, $f1, $f11
		li $v0, 2  #printar um floatt
		syscall
		
		j Finalizar
		
		#-------------------------------------------------------------------------------------------------------------------------------------------------------------------#
		CompraFinal4: 
		li $v0, 4 #printar uma string
		la $a0, MsgPedido
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t4
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a2
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f2
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t4, $f8
		cvt.s.w $f8, $f8
		mul.s $f20, $f8, $f2
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f20
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t5
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a3
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f3
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t5, $f10
		cvt.s.w $f10, $f10
		mul.s $f22, $f10, $f3
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f22
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t6
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $t1
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f4
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t6, $f14
		cvt.s.w $f14, $f14
		mul.s $f24, $f14, $f4
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f24
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t7
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $t2
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f5
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t7, $f16
		cvt.s.w $f16, $f16
		mul.s $f26, $f16, $f5
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f26
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		##MENSAGEM FINAL 
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotal
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f13, $f11, $f26
		add.s $f12, $f1, $f13
		li $v0, 2  #printar um floatt
		syscall
		
		j Finalizar
		
		#---------------------------------------------------------------------------------------------------------------------------------------------------------------#
		CompraFinal5: 
		li $v0, 4 #printar uma string
		la $a0, MsgPedido
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t4
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a2
		syscall

		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f2
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t4, $f8
		cvt.s.w $f8, $f8
		mul.s $f20, $f8, $f2
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f20
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t5
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $a3
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f3
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t5, $f10
		cvt.s.w $f10, $f10
		mul.s $f22, $f10, $f3
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f22
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t6
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $t1
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f4
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t6, $f14
		cvt.s.w $f14, $f14
		mul.s $f24, $f14, $f4
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f24
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t7
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $t2
		syscall
	
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f5
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t7, $f16
		cvt.s.w $f16, $f16
		mul.s $f26, $f16, $f5
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f26
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 1 #printando a quantidade do produto
		move $a0, $t8
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgX
		syscall
		
		li $v0, 4 #printar uma string
		move $a0, $t3
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorUnitario
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f6
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotalProduto
		syscall 
		
		mtc1 $t8, $f18
		cvt.s.w $f18, $f18
		mul.s $f28, $f18, $f6
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f12, $f1, $f28
		li $v0, 2  #printar um floatt
		syscall
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		li $v0, 4 #printar uma string
		la $a0, MsgVazio
		syscall 
		
		##MENSAGEM FINAL 
		li $v0, 4 #printar uma string
		la $a0, MsgValorTotal
		syscall 
		
		lwc1 $f1, Zero  #adaptando para usar float
		add.s $f15, $f13, $f28
		add.s $f12, $f1, $f15
		li $v0, 2  #printar um floatt
		syscall
		
		j Finalizar
		
		Finalizar:
			li $v0, 10
			syscall
		
		
		
		
		
		
		
		
