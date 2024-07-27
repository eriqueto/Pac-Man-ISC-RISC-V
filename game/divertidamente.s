###############################################
#  Programa de exemplo para Syscall MIDI      #
#  ISC Abr 2018				      			  #
#  Marcus Vinicius Lamar		     		  #
###############################################

.data
# Numero de Notas a tocar
NUM: .word 64
NUM2: .word 8
# lista de nota,duração,nota,duração,nota,duração,...
NOTAS:  59, 230, 47, 230, 45, 230, 59, 230, 47, 230, 45, 230, 57, 230, 55, 230, 57, 230, 59, 230, 47, 230, 55, 230, 45, 230, 47, 230, 57, 230, 55, 230, 54, 230, 59, 230, 47, 230, 55, 230, 45, 230, 47, 230, 57, 230, 55, 230, 54, 230, 59, 230, 47, 230, 60, 230, 50, 230, 60, 230, 59, 230, 55, 230, 53, 230, 48, 230, 45, 230, 57, 230, 48, 230, 45, 230, 55, 230, 53, 230, 55, 230, 57, 230, 48, 230, 53, 230, 45, 230, 48, 230, 55, 230, 53, 230, 52, 230, 57, 230, 48, 230, 53, 230, 45, 230, 48, 230, 55, 230, 53, 230, 52, 230, 57, 230, 45, 230, 53, 230, 60, 230, 59, 230, 57, 230, 53, 230 
NOTAS2: 43, 1846, 43, 1846, 43, 1846, 43, 1846, 41, 1846, 41, 1846, 41, 1846, 41, 1846 

.text
INICIO: 
    la s0, NUM       # define o endereço do número de notas
    lw s1, 0(s0)     # le o numero de notas
    la s0, NOTAS     # define o endereço das notas
    li t0, 0         # zera o contador de notas

    la s2, NUM2      # define o endereço do número de notas2
    lw s3, 0(s2)     # le o numero de notas2
    la s2, NOTAS2    # define o endereço de notas2
    li t1, 0         # zera o contador de notas2

    li a2, 32        # define o instrumento para notas
    li a4, 87       # define o instrumento para notas2
    li a3, 127       # define o volume para notas
    li s4, 0	     # 16 para contagem de notas2
    
INST_DOIS: 
    lw a6, 0(s2)     # le o valor da segunda nota
    lw a7, 4(s2)     # le a duracao da segunda nota
    mv a0, a6        # move valor da segunda nota para a0
    mv a1, a7        # move duracao da segunda nota para a1
    li a7, 31        # define a chamada de syscall para tocar nota
    ecall            # toca a segunda nota

    addi s4, s4, 8   # zera o contador de notas2
    addi s2, s2, 8   # incrementa para o endereço da próxima nota
    addi t1, t1, 1   # incrementa o contador de notas

LOOP_MUSICA:   
    beq t0, s1, REINICIA     # se o contador chegou no final, vá para REINICIA
    beq t0, s4, INST_DOIS    # se o contador2 chegou em 16, vá para DOIS
    
    lw a0, 0(s0)        # le o valor da nota
    lw a1, 4(s0)        # le a duracao da nota
    li a7, 31           # define a chamada de syscall para tocar nota
    ecall               # toca a nota

    addi a1, a1, -5	    # reduzir a pausa pra evitar pausa abrupta nas notas
    mv a0, a1           # move duracao da nota para a pausa
    li a7, 32           # define a chamada de syscal para pausa
    ecall               # realiza uma pausa de a0 ms

    addi s0, s0, 8      # incrementa para o endereço da próxima nota
    addi t0, t0, 1      # incrementa o contador de notas

    j LOOP_MUSICA      # volta ao loop

REINICIA:
	j INICIO			# volta ao inicio

FIM:
    li a0, 0
    li a1, 0
    li a2, 0
    li a3, 0
    li t0, 0
    li s0, 0
    li s1, 0
    ret
