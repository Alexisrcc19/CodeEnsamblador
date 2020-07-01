section .data
    mensajea db 'Ingrese el primer número', 10
    len_mgsg equ $-mensajea
    
    mensajeb db 'Ingrese el segundo número', 10
    len_msg equ $-mensajeb
    
    mensaje_presentacion db 'La suma es', 10
    len_mgsg_pre equ $-mensaje_presentacion

section .bss
    a resb 2
    b resb 2
    suma resb 1
section .text 
    global _start
_start:  

	
;*************Ingreso A******************************
    mov eax, 4
    mov ebx, 1
    mov ecx, mensajea
    mov edx, len_mgsg
    int 80h


    mov eax, 3              ; define el tipo de operacion
    mov ebx, 2              ; estandar de entrada
    mov ecx, a         ; lo que captura en el teclado
    mov edx, 2              ; nro de caracteres
    int 80h                 ; interrupcion de gnu linux
     
    
    ;*************Ingreso B******************************
    mov eax, 4
    mov ebx, 1
    mov ecx, mensajeb
    mov edx, len_msg
    int 80h


    mov eax, 3              ; define el tipo de operacion
    mov ebx, 2              ; estandar de entrada
    mov ecx, b         ; lo que captura en el teclado
    mov edx, 2              ; nro de caracteres
    int 80h    
     
; PROCESO DE LA SUMA
    mov ax, [a] 
	mov bx, [b]
	sub ax, '0'        ;valores convertidos en digito
	sub bx, '0'
	
    add ax, bx
	add ax, '0'        ;convertir a cadena
	mov [suma] , ax 
	
    ; RESULTADO DE LA SUMA 
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_presentacion
    mov edx, len_mgsg_pre
    int 80h 

   
    
    mov eax, 4
    mov ebx, 1
    mov ecx, suma
    mov edx, 1
    int 80h 

    mov eax ,1
    int 80h
