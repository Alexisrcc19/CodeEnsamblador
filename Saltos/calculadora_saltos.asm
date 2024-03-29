; CALCULADORA
; Alexis ROLANDO Cañar Correa
; 6to




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
    
	; Imprimimos en pantalla el mensaje 1
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, lmsg1
	int 80h
 
	
 
	; Mensaje ingresa el primer numero
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 80h
 
	; Obtenemos el numero 1
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
	
	
	; Mensaje ingresa el segundo numero
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, lmsg3
	int 80h
 
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h
 
 	; Mensajes del menu
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4      ; Mensaje Suma
	mov edx, lmsg4
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg5      ; Mensaje Resta
	mov edx, lmsg5
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg6       ; Mensaje Multipicacion
	mov edx, lmsg6
	int 80h
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg7       ; Mensaje Division
	mov edx, lmsg7
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg11      ; Mensaje Salir
	mov edx, lmsg11
	int 80h

	; MESANJE OPCIONES
	mov eax, 4
	mov ebx, 1
	mov ecx, msg8       
	mov edx, lmsg8
	int 80h
	
	; Obtenemos la opcion
	mov eax, 3
	mov ebx, 0
	mov ecx, opcion
	mov edx, 2
	int 80h
	
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
	mov eax, 4
	mov ebx, 1
	mov ecx, msg10
	mov edx, lmsg10
	int 80h
 
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
 
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 2
	int 80h
 
	jmp salir

 
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
 
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp salir

 
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
 
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp salir

 
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
 
	; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp salir

 
salir:
	; Imprimimos en pantalla dos nuevas lineas
	mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h
 
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
