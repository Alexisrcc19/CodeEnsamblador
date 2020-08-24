; CALCULADORA
; Alexis ROLANDO Cañar Correa
; 13-07-2020
; 6to

%macro imprimir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1        ;Variable 1
	mov edx, %2        ;Variable 2
	int 80h
%endmacro

%macro leer 2
    mov eax, 3              ; define el tipo de operacion
    mov ebx, 2              ; estandar de entrada
    mov ecx, %1         ; lo que captura en el teclado
    mov edx, %2              ; nro de caracteres
    int 80h                 ; interrupcion de gnu linux
%endmacro


section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		'Numero 2: ',0
	lmsg3		equ		$ - msg3
	
	msg4		db		10,'1. Sumar',10,0
	lmsg4		equ		$ - msg4
 
	msg5		db		10,'2. Restar',10,0
	lmsg5		equ		$ - msg5
 
    msg6		db		10,'3. Multiplicar',10,0
	lmsg6		equ		$ - msg6
    
    msg7		db		10,'4. Dividir',10,0
	lmsg7		equ		$ - msg7
	
	msg8		db		10,'Seleccione una opcion: ',10,0
	lmsg8		equ		$ - msg8
	
	msg11		db		10,'5. Salir',10,0
	lmsg11		equ		$ - msg11

	msg9		db		10,'Resultado: ',0
	lmsg9		equ		$ - msg9
 
	msg10		db		10,'Opcion Invalida',10,0
	lmsg10		equ		$ - msg10
 
	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea
 
section .bss
    opcion:     resb    2
  	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
 
section .text
 	global _start
 
_start:
    ;********** Titulo del ejercicio *********************
	imprimir msg1, lmsg1

	;Leer el primer numero
	imprimir msg2, lmsg2
	leer num1,2
 
	;Leer el segundo numero
	imprimir msg3, lmsg3
	leer num2,2
	
	
	; MENU
menu:	
	imprimir msg4, lmsg4
	imprimir msg5, lmsg5
	imprimir msg6, lmsg6
	imprimir msg7, lmsg7
	imprimir msg11, lmsg11
	
 	;Leer LA OPCION
	imprimir msg8, lmsg8
	leer opcion,2
	
	mov al, [opcion]
	sub al, '0'
	
	; Comparar valor ingresado por el usu^ario
	; JE = jm (condicional) if exists equal, salta cuando los valores de los 2 operandos son iguales.
	
	cmp al,1
	je sumar
	cmp al,2
	je restar
	cmp al,3
	je multiplicar
	cmp al,4
	je dividir
	cmp al,5
	je salir
 
	; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
	; la ejecucion del programa
	imprimir msg10, lmsg10
	
 sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
;	aaa
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el resultado
	imprimir msg9, lmsg9
	imprimir resultado, 2
	; Imprimimos en pantalla el resultado
	imprimir nlinea, lnlinea
	
	jmp menu

 
restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Restamos el registro AL y BL
	sub al, bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el resultado
	imprimir msg9, lmsg9
	imprimir resultado, 2
	; Imprimimos en pantalla el resultado
	imprimir nlinea, lnlinea
 
	jmp menu

 
multiplicar:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Multiplicamos. AX = AL X BL
	mul bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el resultado
	imprimir msg9, lmsg9
	imprimir resultado, 2
	; Imprimimos en pantalla el resultado
	imprimir nlinea, lnlinea
 
	jmp menu

 
dividir:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el resultado
	imprimir msg9, lmsg9
	imprimir resultado, 2
	; Imprimimos en pantalla el resultado
	imprimir nlinea, lnlinea
 
	jmp menu

 
salir:

	; Imprimimos en pantalla dos nuevas lineas
	
	; Imprimimos en pantalla el resultado
	imprimir nlinea, lnlinea
 
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
