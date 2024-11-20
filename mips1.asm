.data
	menu: .asciiz "------------ MENU ------------\n1. Convertir Decimal a Binario\n2. Convertir Binario a Decimal\n3. Generar un número aleatorio\n4. Salir\n\n"
	ingreso: .asciiz "Ingrese una opción: "
	caso1: .asciiz "\n-----Convertir Decimal a Binario-----\n"
	caso2: .asciiz "\n-----Convertir Binario a Decimal-----\n"
	caso3: .asciiz "\n-----Generar un Número Aleatorio-----\n"
	print1: .asciiz "El número en binario es: "
	print2: .asciiz "El número en decimal es: "
	error: .asciiz "Entrada no válida. Por favor ingrese un número.\n\n"
	errorop: .asciiz "Se ingresó una opción no válida\n"
	error1a: .asciiz "Por favor, ingrese un número menor a 255\n\n"
	error2a: .asciiz "Por favor, ingrese un número de 8 bits\n\n"
	error2b: .asciiz "Valor ingresado no válido\nPor favor, ingrese un número binario\n\n"
	ingreso1: .asciiz "Ingrese un número en base 10: "
	ingreso2: .asciiz "Ingrese un número en binario: "
	finCaso: .asciiz "--------------------------------------\n\n"
	salto: .asciiz "\n"
	
	buffer: .space 32
	binario: .space 32

.text
		li $t0, 1 #s0 = end
	loop: 	beq $t0, $zero, exit
		li $v0, 4
		la $a0, menu
		syscall
		la $a0, ingreso
		syscall
		li $v0, 12
		syscall
		move $t1, $v0
		li $v0, 4
		la $a0, salto
		syscall
		#inicio del switch
	case1:	bne $t1, 49, case2
		la $a0, caso1
		syscall
	input1:	li $v0, 4
		la $a0, ingreso1
		syscall
		li $v0, 8
		la $a0, buffer
		li $a1, 32
		syscall
		move $t6, $a0
		Jal esNumero
		move $t1, $v0
 		beq $t1, -1, input1
 		move $a0, $t6
 		Jal convertirAInt
 		sgt $t1, $v0, 255
 		beq $t1, $zero, c2_cast
 		li $v0, 4
 		la $a0, error1a
 		syscall
 		J input1 
 	c2_cast:move $a0, $v0
 		Jal decimalABinario
 		li $v0, 4
		la $a0, finCaso
		syscall
		J loop
	case2:	bne $t1, 50, case3
		la $a0, caso2
		syscall
	input2:	li $v0, 4
		la $a0, ingreso2
		syscall
		li $v0, 8
		la $a0, buffer
		li $a1, 32
		syscall
		move $t6, $a0
 		Jal esNumero
 		move $t1, $v0
 		beq $t1, -1, input2
 		move $a0, $t6
 		Jal binarioADecimal
		slt $t1, $v0, $zero
		bne $t1, $zero, input2
		la $a0, finCaso
		syscall
		J loop	
	case3: 	bne $t1, 51, case4
		la $a0, caso3
		syscall
		li $v0, 42
		li $a1, 40	#upper bound
		syscall
		addi $a0, $a0, 10	#[0,40] -> [10, 50]
		move $t2, $a0
		li $v0, 4
		la $a0, print2
		syscall
		li $v0, 1
		move $a0, $t2
		syscall
		li $v0, 4
		la $a0, salto
		syscall
		move $a0, $t2
		Jal decimalABinario
		li $v0, 4
		la $a0, finCaso
		syscall
		J loop
	case4:	bne $t1, 52, default
		li $t0, 0
		J loop
	default:la $a0, errorop
		syscall
		la $a0, salto
		syscall
		J loop
				
	esNumero:		addi $sp, $sp, -4
				sw $s0, 0($sp)	#s0 = i
				move $t6, $a0	#t6 = tempN
				li $s0, 0
				la $t7, buffer
		process_loop:	lb $t1, 0($t7)
				beq $t1, 10, second_cond
				J second_if		
		second_cond:	beq $s0, $zero, end_error
		second_if:	beq $t1, 10, end_loop
				slti $t2, $t1, 48
				bne $t2, $zero, end_error
				li $t2, 57
				sgt $t2, $t1, $t2
				bne $t2, $zero, end_error
				addi $t7, $t7, 1
				addi $s0, $s0, 1
				J process_loop
		end_loop:	lw $s0, 0($sp)
				move $a0, $t6
				addi $sp, $sp, 4
				li $v0, 1		
				Jr $ra
		end_error:	lw $s0, 0($sp)
				li $v0, 4
				la $a0, error
				syscall
				li $v0, -1
				move $a0, $t6
				addi $sp, $sp, 4
				Jr  $ra
	
	convertirAInt:		addi $sp, $sp, -8
				sw $s0, 0($sp)		#s0 = dígitos
				sw $s1, 4($sp)		#s1 = int
				la $t7, buffer
				li $s1, 0
		ciLoop:		lb $s0, 0($t7)
				beq $s0, 10, ciLoop_end
				li $t2, '0'
				sub $s0, $s0, $t2
				mul $s1, $s1, 10
				add $s1, $s1, $s0
				addi $t7, $t7, 1
				J ciLoop
		ciLoop_end:	move $v0, $s1
				lw $s0, 0($sp)
				lw $s1, 4($sp)
				addi $sp, $sp, 8
				Jr $ra
	
	decimalABinario:	addi $sp, $sp, -4
				sw $s0, 0($sp)	#s0 = contadorDeBits
				li $s0, 0
				move $t6, $a0
				la $t4, binario
				beqz $t6, dbIf_n_is_0
		dbLoop:		beqz $t6, dbLoop_end
		dbIf_n_is_0:	andi $t1, $t6, 1
				sb $t1, 0($t4)
				addi $t4, $t4, 1
				div $t6, $t6, 2
				addi $s0, $s0, 1
				J dbLoop
		dbLoop_end:	li $v0, 4
				la $a0, print1
				syscall
				la $t4, binario
				add $t4, $t4, $s0
				subi $t4, $t4, 1
		dbLoop1:	beqz $s0, dbLoop1_end
				lb $t1, 0($t4)
				li $v0, 11
				addi $t1, $t1, '0'
				move $a0, $t1
				syscall
				add $t4, $t4, -1
				add $s0, $s0, -1
				J dbLoop1
		dbLoop1_end:	li $v0, 4
				la $a0, salto
				syscall
				lw $s0, 0($sp)
				addi $sp, $sp, 4
				Jr $ra															
				
	binarioADecimal:	addi $sp, $sp, -12
				sw $s0, 0($sp)	#s0 = digito
				sw $s1, 4($sp)	#s1 = suma
				sw $s2, 8($sp)	#s2 = cont
				li $s1, 0
				li $s2, 0
				la $t7, buffer
		bdLoop:		lb $s0, 0($t7)
				beq $s0, 10, bdLoop_end
				addi $s2, $s2, 1
				sgt $t2, $s2, 8
				bne $t2, $zero, bdError2a 
				li $t2, '0'
				li $t3, '1'
				beq $s0, $t2, bdBit_zero
				beq $s0, $t3, bdBit_one
				J bdError2b
				addi $s2, $s2, 1
				li $v0, -1
				J bdSaves
		bdBit_zero:	mul $s1, $s1, 2
				addi $t7, $t7, 1
				J bdLoop
		bdBit_one:	mul $s1, $s1, 2
				addi $s1, $s1, 1
				addi $t7, $t7, 1
				J bdLoop
				
		bdError2b:	li $v0, 4
				la $a0, error2b
				syscall
				li $v0, -1
				J bdSaves
		
		bdError2a:	li $v0, 4
				la $a0, error2a
				syscall
				li $v0, -1
				J bdSaves
				
		bdLoop_end:	li $v0, 4
				la $a0, print2
				syscall
				li $v0, 1
				move $a0, $s1
				syscall
				li $v0, 4
				la $a0, salto
				syscall
				J bdSaves
				
		bdSaves:	lw $s0, 0($sp)
				lw $s1, 4($sp)
				lw $s2, 8($sp)
				move $a0, $t6
				addi $sp, $sp, 12
				Jr  $ra

	exit:
