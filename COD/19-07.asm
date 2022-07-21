.data
input:		.asciiz "../.temp/input.txt" # caminho para arquivo de entrada
output: 		.asciiz "../.temp/output.txt" # caminho para arquivo de saída
buffer: 		.space 32 # criação do buffer
list: 			.word 9,5,1,10,7,2
list_sorted:	.word 9,5,1,10,7,2
list_size:		.word 6

.text
li $v0, 13  # Instrução syscall para abrir arquivo
la $a0, input # Adicionando caminho para arquivo de entrada
li $a1, 0 # Abrindo para leitura
li $a2, 0
syscall

move $s0, $v0 # movendo file descriptor para outro registrador

li $v0, 14 # leitura do arquivo
move $a0, $s0 # carregando file descriptor no a0
la $a1, buffer # definindo para onde ler
li $a2, 32 # quantidade de leitura
syscall

move $s1, $v0 # guardando quantidade de caracteres lido

li $v0, 16 # fechar um arquivo
move $a0, $s0 # carregando file desciptor
syscall

li $v0, 1 # printar inteiro
move $a0, $s1
syscall

li $v0, 11
la $a0, '\n'
syscall

li $v0, 4
la $a0, buffer # printar buffer
syscall