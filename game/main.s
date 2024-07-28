#########################################################
#							#
# Joy's Chase						#
# Alunos: Davi Galv�o e Eric Harris    			#
#							#
#########################################################

.data

keyboardaddress:
.word 0xFF200000

currentframeaddress:
.word 0xFF000000

points:
.word 0

highscore:
.word 0

.include "sprites/maps/menu.data"
.include "sprites/maps/map1.data"
.include "sprites/maps/map2.data"
.include "sprites/emotions/joy1.data"
.include "sprites/emotions/anger1.data"
.include "sprites/emotions/disgust1.data"
.include "sprites/emotions/sad1.data"
.include "sprites/emotions/fear1.data"
.include "sprites/hud/heart1.data"
.include "sprites/hud/collectibles/powerup.data"
.include "sprites/hud/collectibles/point.data"
.include "sprites/hud/numbers/numbers.data"


.text
# render menu
menu:
	mv a0, zero
	mv a1, zero
	la a2, menu
	jal print
	
# entrada kdmmio	
input:
    lw t1, keyboardaddress    # carrega o endereco de controle do KDMMIO
    lw t0, 0(t1)             # Le bit de Controle Teclado
    andi t0, t0, 0x0001       # mascara o bit menos significativo
    beq t0, zero, loop         # Se nao ha tecla pressionada entao vai para FIM
    lw t2, 4(t1)             # le o valor da tecla tecla
    
    li t0, '1'
    beq t2, t0, map_1          # se tecla pressionada for '1', vai para o map1
    
    li t0, '2'
    beq t2, t0, map_2         # se tecla pressionada for '2', vai para o map2
    
loop:
    j input               # volta a verificar a entrada do teclado		
	
# render map1
map_1:
	mv a0, zero
	mv a1, zero
	la a2, map1
	jal print
	jal renderComponents
	jal setup_1

# render map2
map_2:
	mv a0, zero
	mv a1, zero
	la a2, map2
	jal print
	jal renderComponents
	jal setup_2


renderComponents:
# render characters
	# joy
	li a0, 152
	li a1, 145
	la a2, joy1
	jal print

	# anger
	li a0, 128
	li a1, 115
	la a2, anger1
	jal print

	# sadness
	li a0, 144
	li a1, 115
	la a2, sad1
	jal print
	
	# disgust
	li a0, 160
	li a1, 115
	la a2, disgust1
	jal print
	
	# fear
	li a0, 176
	li a1, 115
	la a2, fear1
	jal print
	

#render lives
	li a0, 20
	li a1, 224
	la a2, heart1
	jal print
	
	li a0, 36
	li a1, 224
	la a2, heart1
	jal print
	
	li a0, 52
	li a1, 224
	la a2, heart1
	jal print
	
	
# setup lvl 1
setup_1:
# powerups
	li a0, 48
	li a1, 50
	la a2, powerup
	jal print
	
	li a0, 256
	li a1, 50
	la a2, powerup
	jal print
	
	li a0, 16
	li a1, 130
	la a2, powerup
	jal print
	
	li a0, 288
	li a1, 130
	la a2, powerup
	jal print
	
	li a0, 16
	li a1, 19
	la a2, point
	jal print
	
	li a0, 32
	li a1, 19
	la a2, point
	jal print
	
	li a0, 48
	li a1, 19
	la a2, point
	jal print
	
	li a0, 64
	li a1, 19
	la a2, point
	jal print
	
	li a0, 80
	li a1, 19
	la a2, point
	jal print
	
	li a0, 96
	li a1, 19
	la a2, point
	jal print
	
	li a0, 112
	li a1, 19
	la a2, point
	jal print

	li a0, 128
	li a1, 19
	la a2, point
	jal print
	
	li a0, 144
	li a1, 19
	la a2, point
	jal print
	
	li a0, 160
	li a1, 19
	la a2, point
	jal print
	
	li a0, 176
	li a1, 19
	la a2, point
	jal print

	li a0, 192
	li a1, 19
	la a2, point
	jal print
	
	li a0, 208
	li a1, 19
	la a2, point
	jal print
	
	li a0, 224
	li a1, 19
	la a2, point
	jal print
	
	li a0, 240
	li a1, 19
	la a2, point
	jal print
	
	li a0, 256
	li a1, 19
	la a2, point
	jal print
	
	li a0, 272
	li a1, 19
	la a2, point
	jal print
	
	li a0, 288
	li a1, 19
	la a2, point
	jal print
	
	li a0, 16
	li a1, 35
	la a2, point
	jal print
	
	li a0, 48
	li a1, 35
	la a2, point
	jal print
	
	li a0, 80
	li a1, 35
	la a2, point
	jal print
	
	li a0, 112
	li a1, 35
	la a2, point
	jal print
	
	li a0, 144
	li a1, 35
	la a2, point
	jal print
	
	li a0, 192
	li a1, 35
	la a2, point
	jal print
	
	li a0, 224
	li a1, 35
	la a2, point
	jal print
	
	li a0, 256
	li a1, 35
	la a2, point
	jal print
	
	li a0, 288
	li a1, 35
	la a2, point
	jal print
	
	li a0, 16
	li a1, 51
	la a2, point
	jal print
	
	li a0, 32
	li a1, 51
	la a2, point
	jal print
	
	li a0, 80
	li a1, 51
	la a2, point
	jal print
	
	li a0, 112
	li a1, 51
	la a2, point
	jal print
	
	li a0, 144
	li a1, 51
	la a2, point
	jal print
	
	li a0, 160
	li a1, 51
	la a2, point
	jal print
	
	li a0, 192
	li a1, 51
	la a2, point
	jal print
	
	li a0, 224
	li a1, 51
	la a2, point
	jal print
	
	li a0, 272
	li a1, 51
	la a2, point
	jal print
	
	li a0, 288
	li a1, 51
	la a2, point
	jal print
	
	li a0, 16
	li a1, 67
	la a2, point
	jal print
	
	li a0, 80
	li a1, 67
	la a2, point
	jal print
	
	li a0, 112
	li a1, 67
	la a2, point
	jal print
	
	li a0, 160
	li a1, 67
	la a2, point
	jal print
	
	li a0, 192
	li a1, 67
	la a2, point
	jal print
	
	li a0, 224
	li a1, 67
	la a2, point
	jal print
	
	li a0, 288
	li a1, 67
	la a2, point
	jal print
	
	li a0, 16
	li a1, 83
	la a2, point
	jal print
	
	li a0, 80
	li a1, 83
	la a2, point
	jal print
	
	li a0, 112
	li a1, 83
	la a2, point
	jal print
	
	li a0, 128
	li a1, 83
	la a2, point
	jal print
	
	li a0, 144
	li a1, 83
	la a2, point
	jal print
	
	li a0, 160
	li a1, 83
	la a2, point
	jal print
	
	li a0, 176
	li a1, 83
	la a2, point
	jal print
	
	li a0, 192
	li a1, 83
	la a2, point
	jal print
	
	li a0, 224
	li a1, 83
	la a2, point
	jal print
	
	li a0, 288
	li a1, 83
	la a2, point
	jal print
	
	li a0, 16
	li a1, 99
	la a2, point
	jal print
	
	li a0, 32
	li a1, 99
	la a2, point
	jal print
	
	li a0, 48
	li a1, 99
	la a2, point
	jal print

	li a0, 64
	li a1, 99
	la a2, point
	jal print
	
	li a0, 80
	li a1, 99
	la a2, point
	jal print
	
	li a0, 96
	li a1, 99
	la a2, point
	jal print
	
	li a0, 208
	li a1, 99
	la a2, point
	jal print
	
	li a0, 224
	li a1, 99
	la a2, point
	jal print
	
	li a0, 240
	li a1, 99
	la a2, point
	jal print
	
	li a0, 256
	li a1, 99
	la a2, point
	jal print
	
	li a0, 272
	li a1, 99
	la a2, point
	jal print
	
	li a0, 288
	li a1, 99
	la a2, point
	jal print
	
	li a0, 48
	li a1, 115
	la a2, point
	jal print
	
	li a0, 96
	li a1, 115
	la a2, point
	jal print
	
	li a0, 208
	li a1, 115
	la a2, point
	jal print
	
	li a0, 256
	li a1, 115
	la a2, point
	jal print
	
	li a0, 48
	li a1, 131
	la a2, point
	jal print
	
	li a0, 96
	li a1, 131
	la a2, point
	jal print
	
	li a0, 208
	li a1, 131
	la a2, point
	jal print
	
	li a0, 256
	li a1, 131
	la a2, point
	jal print
	
	li a0, 16
	li a1, 147
	la a2, point
	jal print
	
	li a0, 48
	li a1, 147
	la a2, point
	jal print
	
	li a0, 64
	li a1, 147
	la a2, point
	jal print
	
	li a0, 96
	li a1, 147
	la a2, point
	jal print
	
	li a0, 112
	li a1, 147
	la a2, point
	jal print
	
	li a0, 128
	li a1, 147
	la a2, point
	jal print
	
	li a0, 144
	li a1, 147
	la a2, point
	jal print
	
	li a0, 160
	li a1, 147
	la a2, point
	jal print
	
	li a0, 176
	li a1, 147
	la a2, point
	jal print
	
	li a0, 192
	li a1, 147
	la a2, point
	jal print
	
	li a0, 208
	li a1, 147
	la a2, point
	jal print
	
	li a0, 240
	li a1, 147
	la a2, point
	jal print
	
	li a0, 256
	li a1, 147
	la a2, point
	jal print
	
	li a0, 288
	li a1, 147
	la a2, point
	jal print
	
	li a0, 16
	li a1, 163
	la a2, point
	jal print
	
	li a0, 64
	li a1, 163
	la a2, point
	jal print
	
	li a0, 128
	li a1, 163
	la a2, point
	jal print
	
	li a0, 176
	li a1, 163
	la a2, point
	jal print
	
	li a0, 240
	li a1, 163
	la a2, point
	jal print
	
	li a0, 288
	li a1, 163
	la a2, point
	jal print
	
	li a0, 16
	li a1, 179
	la a2, point
	jal print
	
	li a0, 16
	li a1, 179
	la a2, point
	jal print
	
	li a0, 32
	li a1, 179
	la a2, point
	jal print
	
	li a0, 48
	li a1, 179
	la a2, point
	jal print
	
	li a0, 64
	li a1, 179
	la a2, point
	jal print
	
	li a0, 80
	li a1, 179
	la a2, point
	jal print
	
	li a0, 96
	li a1, 179
	la a2, point
	jal print
	
	li a0, 112
	li a1, 179
	la a2, point
	jal print
	
	li a0, 128
	li a1, 179
	la a2, point
	jal print
	
	li a0, 176
	li a1, 179
	la a2, point
	jal print
	
	li a0, 192
	li a1, 179
	la a2, point
	jal print
	
	li a0, 208
	li a1, 179
	la a2, point
	jal print
	
	li a0, 224
	li a1, 179
	la a2, point
	jal print
	
	li a0, 240
	li a1, 179
	la a2, point
	jal print
	
	li a0, 256
	li a1, 179
	la a2, point
	jal print
	
	li a0, 272
	li a1, 179
	la a2, point
	jal print
	
	li a0, 288
	li a1, 179
	la a2, point
	jal print
	
	li a0, 16
	li a1, 195
	la a2, point
	jal print
	
	li a0, 96
	li a1, 195
	la a2, point
	jal print
	
	li a0, 208
	li a1, 195
	la a2, point
	jal print
	
	li a0, 288
	li a1, 195
	la a2, point
	jal print
	
	li a0, 16
	li a1, 211
	la a2, point
	jal print
	
	li a0, 32
	li a1, 211
	la a2, point
	jal print
	
	li a0, 48
	li a1, 211
	la a2, point
	jal print
	
	li a0, 64
	li a1, 211
	la a2, point
	jal print
	
	li a0, 80
	li a1, 211
	la a2, point
	jal print
	
	li a0, 96
	li a1, 211
	la a2, point
	jal print
	
	li a0, 112
	li a1, 211
	la a2, point
	jal print
	
	li a0, 128
	li a1, 211
	la a2, point
	jal print
	
	li a0, 144
	li a1, 211
	la a2, point
	jal print
	
	li a0, 160
	li a1, 211
	la a2, point
	jal print
	
	li a0, 176
	li a1, 211
	la a2, point
	jal print
	
	li a0, 192
	li a1, 211
	la a2, point
	jal print
	
	li a0, 208
	li a1, 211
	la a2, point
	jal print
	
	li a0, 224
	li a1, 211
	la a2, point
	jal print
	
	li a0, 240
	li a1, 211
	la a2, point
	jal print
	
	li a0, 256
	li a1, 211
	la a2, point
	jal print
	
	li a0, 272
	li a1, 211
	la a2, point
	jal print
	
	li a0, 288
	li a1, 211
	la a2, point
	jal print

# setup lvl 2
setup_2:
# powerups
	li a0, 16
	li a1, 18
	la a2, powerup
	jal print
	
	li a0, 288
	li a1, 18
	la a2, powerup
	jal print
	
	li a0, 16
	li a1, 210
	la a2, powerup
	jal print
	
	li a0, 288
	li a1, 210
	la a2, powerup
	jal print
# points
	#1a coluna
	li a0, 16
	li a1, 34
	la a2, point
	jal print
	
	li a0, 16
	li a1, 50
	la a2, point
	jal print
	
	li a0, 16
	li a1, 66
	la a2, point
	jal print
	
	li a0, 16
	li a1, 82
	la a2, point
	jal print
	
	li a0, 16
	li a1, 98
	la a2, point
	jal print
	
	li a0, 16
	li a1, 114
	la a2, point
	jal print
	
	li a0, 16
	li a1, 130
	la a2, point
	jal print
	
	li a0, 16
	li a1, 146
	la a2, point
	jal print
	
	li a0, 16
	li a1, 162
	la a2, point
	jal print
	
	li a0, 16
	li a1, 178
	la a2, point
	jal print
	
	li a0, 16
	li a1, 194
	la a2, point
	jal print
	
	#2a coluna
	li a0, 32
	li a1, 18
	la a2, point
	jal print
	
	li a0, 32
	li a1, 82
	la a2, point
	jal print
	
	li a0, 32
	li a1, 114
	la a2, point
	jal print
	
	li a0, 32
	li a1, 146
	la a2, point
	jal print
	
	li a0, 32
	li a1, 210
	la a2, point
	jal print
	
	#3a coluna
	li a0, 48
	li a1, 18
	la a2, point
	jal print
	
	li a0, 48
	li a1, 50
	la a2, point
	jal print
	
	li a0, 48
	li a1, 66
	la a2, point
	jal print
	
	li a0, 48
	li a1, 82
	la a2, point
	jal print
	
	li a0, 48
	li a1, 114
	la a2, point
	jal print
	
	li a0, 48
	li a1, 146
	la a2, point
	jal print
	
	li a0, 48
	li a1, 162
	la a2, point
	jal print
	
	li a0, 48
	li a1, 178
	la a2, point
	jal print
	
	li a0, 48
	li a1, 210
	la a2, point
	jal print
	
	
	#4a coluna
	li a0, 64
	li a1, 18
	la a2, point
	jal print
	
	li a0, 64
	li a1, 50
	la a2, point
	jal print
	
	li a0, 64
	li a1, 114
	la a2, point
	jal print
	
	li a0, 64
	li a1, 178
	la a2, point
	jal print
	
	li a0, 64
	li a1, 210
	la a2, point
	jal print
	
	#5a coluna
	li a0, 80
	li a1, 18
	la a2, point
	jal print
	
	li a0, 80
	li a1, 34
	la a2, point
	jal print
	
	li a0, 80
	li a1, 50
	la a2, point
	jal print
	
	li a0, 80
	li a1, 98
	la a2, point
	jal print
	
	li a0, 80
	li a1, 114
	la a2, point
	jal print
	
	li a0, 80
	li a1, 130
	la a2, point
	jal print
	
	li a0, 80
	li a1, 162
	la a2, point
	jal print
	
	li a0, 80
	li a1, 178
	la a2, point
	jal print
	
	li a0, 80
	li a1, 194
	la a2, point
	jal print
	
	li a0, 80
	li a1, 210
	la a2, point
	jal print
	
	#6a coluna
	li a0, 96
	li a1, 50
	la a2, point
	jal print
	
	li a0, 96
	li a1, 82
	la a2, point
	jal print
	
	li a0, 96
	li a1, 98
	la a2, point
	jal print
	
	li a0, 96
	li a1, 130
	la a2, point
	jal print
	
	li a0, 96
	li a1, 146
	la a2, point
	jal print
	
	li a0, 96
	li a1, 162
	la a2, point
	jal print

	li a0, 96
	li a1, 210
	la a2, point
	jal print
	
	#7a coluna
	li a0, 112
	li a1, 18
	la a2, point
	jal print
	
	li a0, 112
	li a1, 34
	la a2, point
	jal print
	
	li a0, 112
	li a1, 50
	la a2, point
	jal print
	
	li a0, 112
	li a1, 66
	la a2, point
	jal print
	
	li a0, 112
	li a1, 82
	la a2, point
	jal print
	
	li a0, 112
	li a1, 146
	la a2, point
	jal print
	
	li a0, 112
	li a1, 194
	la a2, point
	jal print
	
	li a0, 112
	li a1, 210
	la a2, point
	jal print
	
	#8a coluna
	li a0, 128
	li a1, 18
	la a2, point
	jal print
	
	li a0, 128
	li a1, 50
	la a2, point
	jal print
	
	li a0, 128
	li a1, 82
	la a2, point
	jal print
	
	li a0, 128
	li a1, 146
	la a2, point
	jal print
	
	li a0, 128
	li a1, 162
	la a2, point
	jal print
	
	li a0, 128
	li a1, 178
	la a2, point
	jal print
	
	li a0, 128
	li a1, 194
	la a2, point
	jal print	
	
	#9a coluna
	li a0, 144
	li a1, 18
	la a2, point
	jal print
	
	li a0, 144
	li a1, 50
	la a2, point
	jal print
	
	li a0, 144
	li a1, 82
	la a2, point
	jal print
	
	
	#10a coluna
	li a0, 160
	li a1, 18
	la a2, point
	jal print
	
	li a0, 160
	li a1, 50
	la a2, point
	jal print
	
	li a0, 160
	li a1, 82
	la a2, point
	jal print
	
	
	#11a coluna
	li a0, 176
	li a1, 18
	la a2, point
	jal print
	
	li a0, 176
	li a1, 50
	la a2, point
	jal print
	
	li a0, 176
	li a1, 82
	la a2, point
	jal print
	
	li a0, 176
	li a1, 146
	la a2, point
	jal print
	
	li a0, 176
	li a1, 162
	la a2, point
	jal print
	
	li a0, 176
	li a1, 178
	la a2, point
	jal print
	
	li a0, 176
	li a1, 194
	la a2, point
	jal print
	
	
	#12a coluna
	li a0, 192
	li a1, 18
	la a2, point
	jal print

	li a0, 192
	li a1, 34
	la a2, point
	jal print

	li a0, 192
	li a1, 50
	la a2, point
	jal print
	
	li a0, 192
	li a1, 66
	la a2, point
	jal print
	
	li a0, 192
	li a1, 82
	la a2, point
	jal print
	
	li a0, 192
	li a1, 146
	la a2, point
	jal print
	
	li a0, 192
	li a1, 194
	la a2, point
	jal print
	
	li a0, 192
	li a1, 210
	la a2, point
	jal print
	
	#13a coluna
	li a0, 208
	li a1, 50
	la a2, point
	jal print
	
	li a0, 208
	li a1, 82
	la a2, point
	jal print
	
	li a0, 208
	li a1, 98	
	la a2, point
	jal print
	
	li a0, 208
	li a1, 130	
	la a2, point
	jal print
	
	li a0, 208
	li a1, 146	
	la a2, point
	jal print
	
	li a0, 208
	li a1, 210	
	la a2, point
	jal print
	
	
	#14a coluna
	li a0, 224
	li a1, 18
	la a2, point
	jal print
	
	li a0, 224
	li a1, 34
	la a2, point
	jal print
	
	li a0, 224
	li a1, 50
	la a2, point
	jal print
	
	li a0, 224
	li a1, 98
	la a2, point
	jal print
	
	li a0, 224
	li a1, 114
	la a2, point
	jal print
	
	li a0, 224
	li a1, 130
	la a2, point
	jal print
	
	li a0, 224
	li a1, 162
	la a2, point
	jal print
	
	li a0, 224
	li a1, 18
	la a2, point
	jal print
	
	li a0, 224
	li a1, 178
	la a2, point
	jal print
	
	li a0, 224
	li a1, 194
	la a2, point
	jal print
	
	li a0, 224
	li a1, 210
	la a2, point
	jal print
	
	#15a coluna
	li a0, 240
	li a1, 18
	la a2, point
	jal print
	
	li a0, 240
	li a1, 50
	la a2, point
	jal print
	
	li a0, 240
	li a1, 114
	la a2, point
	jal print
	
	li a0, 240
	li a1, 178
	la a2, point
	jal print
	
	li a0, 240
	li a1, 210
	la a2, point
	jal print
	
	
	#16a coluna
	li a0, 256
	li a1, 18
	la a2, point
	jal print
	
	li a0, 256
	li a1, 50
	la a2, point
	jal print
	
	li a0, 256
	li a1, 66
	la a2, point
	jal print
	
	li a0, 256
	li a1, 82
	la a2, point
	jal print
	
	li a0, 256
	li a1, 114
	la a2, point
	jal print
	
	li a0, 256
	li a1, 146
	la a2, point
	jal print
	
	li a0, 256
	li a1, 162
	la a2, point
	jal print
	
	li a0, 256
	li a1, 178
	la a2, point
	jal print
	
	li a0, 256
	li a1, 210
	la a2, point
	jal print
	
	
	
	
	#17a coluna
	li a0, 272
	li a1, 18
	la a2, point
	jal print
	
	li a0, 272
	li a1, 82
	la a2, point
	jal print
	
	li a0, 272
	li a1, 114
	la a2, point
	jal print
	
	li a0, 272
	li a1, 146
	la a2, point
	jal print
	
	li a0, 272
	li a1, 210
	la a2, point
	jal print
	
	#18a coluna
	li a0, 288
	li a1, 34
	la a2, point
	jal print
	
	li a0, 288
	li a1, 50
	la a2, point
	jal print
	
	li a0, 288
	li a1, 66
	la a2, point
	jal print
	
	li a0, 288
	li a1, 82
	la a2, point
	jal print
	
	li a0, 288
	li a1, 98
	la a2, point
	jal print
	
	li a0, 288
	li a1, 114
	la a2, point
	jal print
	
	li a0, 288
	li a1, 130
	la a2, point
	jal print
	
	li a0, 288
	li a1, 146
	la a2, point
	jal print
	
	li a0, 288
	li a1, 162
	la a2, point
	jal print
	
	li a0, 288
	li a1, 178
	la a2, point
	jal print
	
	li a0, 288
	li a1, 194
	la a2, point
	jal print
	

		
print:
	# basic renderer function
	# utilizes only temporaries
	# a0 = bitmap display x position (from the left)
	# a1 = bitmap display y position (from the top)
	# a2 = image pointer
	# a3 = image selector (for spritesheets)
	
	# t5 = width (x) of image
	lw	t5, 0(a2)
	
	# t6 = height (y) of image
	addi	a2, a2, 4
	lw	t6, 0(a2)
	
	# a2 = start of image pixel information
	addi	a2, a2, 4
	# select image using a3 (for spritesheets)
	add	a2, a3, a2
	
	# illegal printing prevention
	
	# if starting x position is less than zero, print nothing
	blt	a0, zero, end
	# if starting y position is less than zero, print nothing
	blt	a1, zero, end
	# if part of the image falls beyond the display width, print nothing
	li	t1, 320
	add	t0, t5, a0
	bgt	t0, t1, end
	# if part of the image falls beyond the display height, print nothing
	li	t1, 240
	add	t0, t6, a1
	bgt	t0, t1, end
	
	# below are calculations for the display pointer.
	# just knowing it works is enough
	# if you spend enough time reading it you'll understand it
	# t3 = bitmap display location pointer
	li	t3, 320
	mul	a1, t3, a1
	lw	t3, currentframeaddress
	add	t3, a1, t3
	add	t3, a0, t3
	
	# t2 = currentY
	li	t2, 0
	yLoop:
		# while currentY < height
		bge	t2, t6, end
		# init currentX to 0
		li	t1, 0
		xLoop:
			# while currenX < width
			bge	t1, t5, xEnd
			# copy information from image to bitmap display according to the relevant pointers
			lw	t4, 0(a2)
			sw	t4, 0(t3)
			
			# increments
			addi	a2, a2, 4
			addi	t3, t3, 4
			addi	t1, t1, 4
			j	xLoop
		xEnd:
		# next BMD line, reset position according to width
		addi	t3, t3, 320
		sub	t3, t3, t5
		
		# increment currentY
		addi	t2, t2, 1
		j	yLoop	
	end:
	
	# reset a3 for safety purposes (it is only used by display print and is never reset anywhere)
	mv	a3, zero
	ret