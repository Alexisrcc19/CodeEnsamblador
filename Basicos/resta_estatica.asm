; Resta de dos numeros estaticos, no se ingresa por teclado
; Alexis Rolando Cañar Correa
; 6to

section .data
	resultado db "El resutado es:",10
	len equ $-resultado

section .bss
	resta resb 1

section .text
	global _start

_start :
	mov eax, 6
	mov ebx, 2
	sub eax, ebx
	add eax, '0'
	
	mov [resta] , eax

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len
	int 80h
	

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, 1
	int 80h
	
	mov eax,1
	int 80h
	

