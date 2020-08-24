%macro escritura 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
        asterisco db '*'
        new_line db 10,''

section .text
        global _start
_start:
        mov bx, 9 ;filas 
        mov cx, 9 ;columnas
principal:
        ;definicion para filas
        push bx
        cmp bx, 0 ;que la comparacion se realice hasta 0
        jz salir ;cuando el producto de una operacion = 0
        jmp asteriscos

asteriscos:
        dec cx
        push cx
        escritura asterisco, 1 ;el valor de cx se reemplaza con asterisco '*'
        pop cx
        cmp cx, 0
        jg asteriscos     ;jg verifica que le primero operando sea mayor que el segundo
        escritura new_line, 1
        pop bx
        dec bx
        mov cx, 9
        jmp principal

salir:
        mov eax, 1
        int 80h