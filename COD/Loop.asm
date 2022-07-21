.data
list:		.word 9,5,1,10,7,2
size:		.word 6
str: 	.asciiz "Finalizado!"
.text

move $t0, $0 # t0 é o indíce atual
la $t1, list # t1 é a localização de memória base
lw $t2, size # t2 é o tamanho da lista
li $t3, 4 # offset de 4 bytes

j loop

loop:  
	# Finalizando o loop caso a lista tinha sido percorrida
	bge $t0, $t2, end 
	
	mult  $t0, $t3 # multiplicando pelo offset
	mflo $t4 # Endereço do item atual
	lw $t5, list($t4) # Item atual
	
	# Printar item atual
	li $v0, 1 
	move $a0, $t5
	syscall
	
	# Adicionar quebra de linha
	li $v0, 11
	la $a0, '\n'
	syscall
	
	# Incrementar indíce
	addi $t0, $t0, 1
	
	j loop
	
end:

li $v0, 4
la $a0, str
syscall