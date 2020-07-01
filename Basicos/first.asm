section .data
	mensaje db "Hola Mundo"    ;constante mensaje de un byte en memoria
	longitud EQU $-mensaje     ;longitud que calcula el # caracteres de mensaje


section .text
	global _start
_start:
	;********* imprimir el mensaje ************
	mov eax, 4              ; tipo de subrutina, operación => escritura, salida
	mov ebx, 1	        ; tipo de estándar, por teclado
	mov ecx, mensaje	; el registro ecx se almacena la referencia a imprimir "mensaje"
	mov edx, longitud	; el registro edx se almacena la referencia a imprimir por # caracteres
	int 80H			; interrupción de SW para el SO Linux
	
	mov eax, 1		; salida del programa, system_exit,sys_exit
	mov ebx, 0		; si el retorno es 0 (200 en la web) ok
	int 80H
