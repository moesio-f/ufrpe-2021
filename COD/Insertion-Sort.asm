.data 
output: 		.asciiz "../.temp/output.txt" # caminho para arquivo de saída
list: 			.word 9,5,1,10,7,2
size:			.word 6
list_sorted:	.space 24 # 4 bytes (32 bits) por item
sorted_size: 	.word 0
str: 			.asciiz "Finalizado!"

.text
# Objetivo: fazer leitura de uma lista e colocar na ordem crescente escrevendo em um arquivo de texto

move $s0, $t0 # indice atual de list
move $s1, $t0 # indice atual de list_sorted
lw $s2, size # tamanho da lista
lw $s3, sorted_size # tamanho da lista ordenada
move $s4, $t0 # tamanho atual de list_sorted
li $s5, 4 # offset das palavras (4 bytes, 32 bits)

j loop

# Loop externo do insertion sort
loop:  
	# Finalizando o loop externo caso a lista tinha sido percorrida
	bge $s0, $s2, end_sort 
	
	mult  $s0, $s5 # multiplicando pelo offset
	mflo $t0 # Endereço do item atual
	lw $t1, list($t0) # Item atual
	
	move $a0, $t1 # Adicionando parâmetro
	jal replace_sorted # atualizar item na lista ordenada
	
	# Incrementar indíce
	addi $s0, $s0, 1
	
	# Próxima iteração
	j loop
	

# Loop da array ordenada
end_sort:
	es_loop:
		# Finalizando o loop caso a lista tinha sido percorrida
		beq $s1, $s3, stop 
	
		mult  $s1, $s5 # multiplicando pelo offset
		mflo $t0 # Endereço do item atual
		lw $t1, list_sorted($t0) # Item atual

		# Printar item atual
		li $v0, 1 
		move $a0, $t1
		syscall
	
		# Adicionar quebra de linha
		li $v0, 11
		la $a0, '\n'
		syscall
	
		# Incrementar indíce
		addi $s1, $s1, 1
	
		# Próxima iteração
		j es_loop

# --- PROCEDIMENTOS ---

# Adiciona novo item na lista
# $a0 contém valor a ser inserido
replace_sorted:
	move $s1, $0 # resetando o índice
	li $t0, -1 # Ainda não inserimos o valor na lista
	
	r_loop:
		beq $t0, $0, r_end # já inserimos, podemos finalizar
		beq $s1, $s3, r_append_end # podemos inserir na último posição da lista caso tenhamos percorrido o tamanho atual e não inserido
		
		mult  $s1, $s5 # multiplicando pelo offset
		mflo $t2 # Endereço do item atual (dentro da array)
		lw $t3, list_sorted($t2) # Item atual
		
		bgt $a0, $t3, r_loop_inc # testar próximo posição
		ble $a0, $t3, r_loop_ins # inserir na posição atual
		
		r_loop_ins:
			move $t4, $t3
			sw $a0, list_sorted($t2) # armazenar a0 na posição atual
			
			addi $s3, $s3, 1 # aumentando o tamanho em  1
			addi $s1, $s1, 1 # próximo índice
			
			j r_ins_update # atualizar próximos items (i.e., mover todos uma casa para o lado)
			
			r_ins_update:
				beq $s1, $s3, r_ins_end
				
				mult  $s1, $s5 # multiplicando pelo offset
				mflo $t2 # Endereço do item atual (dentro da array)
				lw $t3, list_sorted($t2) # Item atual
				sw $t4, list_sorted($t2) # armazenar t4 na posição atual
				
				move $t4, $t3
				addi $s1, $s1, 1 # próximo índice
				j r_ins_update
				
			r_ins_end:
				move $t0, $0 # acabamos de inserir na lista ordenada
				j r_loop # voltar ao ínicio do loop
		
		r_loop_inc:
			addi $s1, $s1, 1 # incrementando índice
			j r_loop # voltamos ao início do loop
		
	r_append_end:
		addi $s3, $s3, 1 # aumentando o tamanho em  1
		subi $s1, $s3, 1 # atualizando o índice para última posição
		
		mult  $s1, $s5 # multiplicando pelo offset
		mflo $t2 # Endereço do item atual (dentro da array)
		sw $a0, list_sorted($t2) # armazenar a0 na posição atual
		
		move $t0, $0 # acabamos de inserir na lista ordenada
		
		j r_end
	
	r_end:
		li $s1, 0 # resetando o índice da array
		jr $ra # voltar o controle para quem invocou
	
		
# --- FINALIZAÇÃO DO PROGRAMA ---	
stop:
	# Printando mensagem de finalização
	li $v0, 4
	la $a0, str
	syscall
	
	# Finalizando programa
	li $v0, 10
	syscall
	