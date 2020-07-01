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
;*************Asignacion de un numero en Variable***********************
    mov ebx, 7
    add ebx, '0'
    mov [numero], ebx
     
;*************Imprimer Presentacion******************************
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_presentacion
    mov edx, len_mgsg_pre
    int 80h 
;*************Imprime el Numero******************************
    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 5
    int 80h 
;*************SALIDA******************************
    mov eax ,1
    int 80h
