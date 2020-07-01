
; Operaciones basicas de dos numeros estaticos, no se ingresa por teclado
; Alexis ROLANDO Cañar Correa
; 6to


section .data

    enunciado db "Operaciones basicas con numeros estaticos (4 y 2)",10
    len equ $-enunciado

	resultadoS db "Suma: ",10
	lenS equ $-resultadoS
	
	resultadoR db "Resta:",10
	lenR equ $-resultadoR
	
	resultadoM db "Multiplicacion:",10
	lenM equ $-resultadoM
	
	resultadoC db "Cociente de la division:",10
	lenC equ $-resultadoC
	
	resultadoRes db "Residuo de la division:",10
	lenRes equ $-resultadoRes
	
	new_line db " ",10
    len_new_line equ $-new_line


section .bss
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	cociente resb 1 
    residuo resb 1

section .text
	global _start

_start :
	
	mov eax, 4
	mov ebx, 1
	mov ecx, enunciado
	mov edx, len
	int 80h
	
	
	;SUMA
	
	mov al, 4
	mov bl, 2
	
	add bl, al
	add bl, '0'
	
	;mov bl, 2
	;sub al, bl
	;add al, '0'
	
	
	mov [suma] , bl

	mov eax, 4
	mov ebx, 1
	mov ecx, resultadoS
	mov edx, lenS
	int 80h
	

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80h
	
	mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h
    
    
    ;RESTA
	
	mov eax, 4
	mov ebx, 2
	sub eax, ebx
	add eax, '0'
	
	mov [resta] , eax

	mov eax, 4
	mov ebx, 1
	mov ecx, resultadoR
	mov edx, lenR
	int 80h
	

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, 1
	int 80h
	
	mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h
    
	;MULTIPLICACION 
	
	mov eax, 4
	mov ebx, 2
	mul ebx
	add eax, '0'
	
	mov [multiplicacion] , eax

	mov eax, 4
	mov ebx, 1
	mov ecx, resultadoM
	mov edx, lenM
	int 80h
	

	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicacion
	mov edx, 1
	int 80h
	
	mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h
    
    ; DIVISION
    
     mov al,4
    mov bh, 2
    div bh ;eax=eax*ebx
    add al,'0' ;Ajuste para que haga la suma en ascii
    mov [cociente], al
    add ah,'0'
    mov [residuo], ah

    mov eax, 4
    mov ebx, 1
    mov ecx, resultadoC
    mov edx, lenC
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, cociente
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resultadoRes
    mov edx, lenRes
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, residuo
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h
    
	mov eax,1
	int 80h
	
