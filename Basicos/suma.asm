; Suma de dos numeros estaticos, no se ingresa por teclado

section .data
	resultado db "El resutado es:",10
	len equ $-resultado

section .bss
	suma resb 1

section .text
	global _start

_start :
	mov eax, 6
	mov ebx, 2
	add eax, ebx
	add eax, '0'
	
	mov [suma] , eax

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len
	int 80h
	

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80h
	
	mov eax,1
	int 80h
	
