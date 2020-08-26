;Definicion de macro
%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
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
        msj1 db "La suma del ciclo es : "
        len_msj1 equ $-msj1
        
        msj2 db "Contador : "
        len_msj2 equ $-msj2
        
        new_line db " " ,10
        len_new_line equ $-new_line
section .bss
        num resb 2
        cont resb 2
section .text
        global _start
_start:
        imprimir msj2,len_msj2
        leer cont,2
        
        mov ax, 0
        mov cx, [cont]
        sub cx, '0'
       
        ;push ax

loop_for:
        push cx
        mov bx , cx
        imul bx , cx
        ;mul cx
        add ax, bx
        
        ;mul ax
        pop cx
        loop loop_for

        add al, '0'
        mov [num], al
        
        imprimir msj1, len_msj1
        imprimir num, 2
        imprimir new_line, len_new_line 

salir:
        mov eax, 1
        int 80h
