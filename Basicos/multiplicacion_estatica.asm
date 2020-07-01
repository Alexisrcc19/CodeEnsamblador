; Multiplicacion de dos numeros estaticos, no se ingresa por teclado
; Alexis Rolando Cañar Correa
; 6to

section .data
	resultado db "El resutado es:",10
	len equ $-resultado

section .bss
	multiplicacion resb 1

section .text
	global _start

_start :
	mov eax, 4
	mov ebx, 2
	mul ebx
	add eax, '0'
	
	mov [multiplicacion] , eax

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len
	int 80h
	

	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicacion
	mov edx, 1
	int 80h
	
	mov eax,1
	int 80h
	

