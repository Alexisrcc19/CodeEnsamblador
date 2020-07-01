
; Operaciones basicas de dos numeros estaticos, no se ingresa por teclado
; Alexis ROLANDO Cañar Correa
; 6to

%macro imprimir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1        ;Variable 1
	mov edx, %2        ;Variable 2
	int 80h
%endmacro


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
	
	imprimir enunciado, len
	
	;SUMA
	mov al, 4
	mov bl, 2
	add al, bl
	add al, '0'
	
	mov [suma] , al

	imprimir resultadoS , lenS
    imprimir suma, 1
    imprimir new_line, len_new_line
    
    ;RESTA
	mov eax, 4
	mov ebx, 2
	sub eax, ebx
	add eax, '0'
	
	mov [resta] , eax

	imprimir resultadoR , lenR
    imprimir resta, 1
    imprimir new_line, len_new_line
    
	;MULTIPLICACION 
	mov eax, 4
	mov ebx, 2
	mul ebx
	add eax, '0'
	
	mov [multiplicacion] , eax

	imprimir resultadoM , lenM
    imprimir multiplicacion, 1
    imprimir new_line, len_new_line
    
    ; DIVISION
    mov al,4
    mov bh, 2
    div bh ;eax=eax*ebx
    add al,'0' ;Ajuste para que haga la suma en ascii
    mov [cociente], al
    add ah,'0'
    mov [residuo], ah
    
    ;COCIENTE
    imprimir resultadoC , lenC
    imprimir cociente, 1
    imprimir new_line, len_new_line
    

    ;RESIDUO
    imprimir resultadoRes , lenRes
    imprimir residuo, 1
    imprimir new_line, len_new_line
    
    ;SALIR
	mov eax,1
	int 80h
