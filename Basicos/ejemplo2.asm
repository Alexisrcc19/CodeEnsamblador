section .data
    mensaje db 'Ingrese un número', 10
    len_mgsg equ $-mensaje
    mensaje_presentacion db 'El numero ingresado es', 10
    len_mgsg_pre equ $-mensaje_presentacion

section .bss
    numero resb 5
section .text 
    global _start
_start:    
;*************Imprime Mensaje******************************
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len_mgsg
    int 80h


    mov eax, 3              ; define el tipo de operacion
    mov ebx, 2              ; estandar de entrada
    mov ecx, numero         ; lo que captura en el teclado
    mov edx, 5              ; nro de caracteres
    int 80h                 ; interrupcion de gnu linux
     

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_presentacion
    mov edx, len_mgsg_pre
    int 80h 

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 5
    int 80h 

    mov eax ,1
    int 80h