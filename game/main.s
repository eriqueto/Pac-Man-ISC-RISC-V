#########################################
#					#
#            Joy's Chase	 	#
# 	     Created by:		#
#    Davi Galvão and Eric Harris    	#
#					#
#########################################

.data

keyboardaddress:
.word 0xFF200000

currentframeaddress:
.word 0xFF000000

.include "data files/maps/menu.data"
.include "data files/maps/map1.data"
.include "data files/maps/map2.data"
.include "data files/emotions/joy1.data"
.include "data files/emotions/anger1.data"
.include "data files/emotions/disgust1.data"
.include "data files/emotions/sad1.data"
.include "data files/emotions/fear1.data"

.text
# render menu
MENU:
	mv a0, zero
	mv a1, zero
	la a2, menu
	jal displayPrint
	
# keyboard input	
INPUT:
    lw t1,keyboardaddress    # load KDMMIO control address
    lw t0,0(t1)              # read the bit of keyboard control
    andi t0,t0,0x0001        # hide the least significant bit
    beq t0,zero,FIM2         # if there is no key pressed, go to FIM2
    lw t2,4(t1)              # read the ascii value of the key pressed
    
    li t0,'1'
    beq t2,t0,MAP1          # if key pressed is '1', go to MAP1
    
    li t0,'2'
    beq t2,t0,MAP2          # if key pressed is '2', go to MAP2
    
FIM2:
    j INPUT                 # return to INPUT		
	
# render map1
MAP1:
	mv a0, zero
	mv a1, zero
	la a2, map1
	jal displayPrint
	
	j RENDER_CHAR

# render map2
MAP2:
	mv a0, zero
	mv a1, zero
	la a2, map2
	jal displayPrint
	
	j RENDER_CHAR

# render characters	
RENDER_CHAR:
	# joy
	li a0, 152
	li a1, 145
	la a2, joy1
	jal displayPrint

	#anger
	li a0, 128
	li a1, 115
	la a2, anger1
	jal displayPrint

	#sadness
	li a0, 144
	li a1, 115
	la a2, sad1
	jal displayPrint
	
	#disgust
	li a0, 160
	li a1, 115
	la a2, disgust1
	jal displayPrint
	
	#fear
	li a0, 176
	li a1, 115
	la a2, fear1
	jal displayPrint
	
	

displayPrint:
	#########################################################
	# a0 = bitmap display x position 			#
	# a1 = bitmap display y position 			#
	# a2 = image pointer					#
 	#########################################################
	
	# t5 = width (x) of image
	lw	t5, 0(a2)
	
	# t6 = height (y) of image
	addi	a2, a2, 4
	lw	t6, 0(a2)
	
	# a2 = start of image pixel information
	addi	a2, a2, 4
	
	# illegal printing prevention
	
	# if starting x position is less than zero, print nothing
	blt	a0, zero, displayPrintEnd
	# if starting y position is less than zero, print nothing
	blt	a1, zero, displayPrintEnd
	# if part of the image falls beyond the display width, print nothing
	li	t1, 320
	add	t0, t5, a0
	bgt	t0, t1, displayPrintEnd
	# if part of the image falls beyond the display height, print nothing
	li	t1, 240
	add	t0, t6, a1
	bgt	t0, t1, displayPrintEnd
	
	# calculations for the display pointer
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
		bge	t2, t6, displayPrintEnd
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
	displayPrintEnd:
	ret
