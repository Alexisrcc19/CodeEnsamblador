
; Operaciones Dinamicas Macros
; Alexis ROLANDO Cañar Correa
;22-06-2020
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

    mensajea db 'Ingrese el primer número', 10
    len_mgsg equ $-mensajea
    
    mensajeb db 'Ingrese el segundo número', 10
    len_msg equ $-mensajeb

    enunciado db "Operaciones basicas con numeros dinamicos(Ejemplo:4 y 2)",10
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
    a resb 2
    b resb 2
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	cociente resb 1 
    residuo resb 1

section .text
	global _start

_start :
	
	imprimir enunciado, len
	
	;Leer el primer numero
	imprimir mensajea, len_mgsg
	leer a,2
	
	;Leer el segundo numero
	imprimir mensajeb, len_msg
	leer b,2
	
	;SUMA
	mov al,[a]
	mov bl, [b]
	sub al, '0'        ;valores convertidos en digito
	sub bl, '0'
	add al, bl
	add al, '0'
	
	mov [suma] , al

	imprimir resultadoS , lenS
    imprimir suma, 1
    imprimir new_line, len_new_line
    
    ;RESTA
	mov eax, [a]
	mov ebx, [b]
	sub eax, '0'        ;valores convertidos en digito
	sub ebx, '0'
	sub eax, ebx
	add eax, '0'
	
	mov [resta] , eax

	imprimir resultadoR , lenR
    imprimir resta, 1
    imprimir new_line, len_new_line
    
	;MULTIPLICACION 
	mov eax, [a]
	mov ebx, [b]
	sub eax, '0'        ;valores convertidos en digito
	sub ebx, '0'
	mul ebx
	add eax, '0'
	
	mov [multiplicacion] , eax

	imprimir resultadoM , lenM
    imprimir multiplicacion, 1
    imprimir new_line, len_new_line
    
    ; DIVISION
    mov al,[a]
    mov bh, [b]
    sub al, '0'        ;valores convertidos en digito
	sub bh, '0'
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
