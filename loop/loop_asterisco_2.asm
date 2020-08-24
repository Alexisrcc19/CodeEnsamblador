;Ejercicio loop cuadrado-trinagulo asterisco
;Alexis Cañae
;6 A
;20-julio-2020

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
        mov rbx, 9 ;filas
        mov rcx, 9 ;columnas
principal:
        push rbx
        cmp  rbx, 0
        jz salir
        jmp l1
l1:
        push rcx
        escritura asterisco, 1 ;el valor de cx se reemplaza con asterisco '*'
        pop rcx
        loop l1
        
l2:
        escritura new_line, 1
        pop rbx
        dec rbx
        mov rcx, rbx ; valor a modificar para imprimir cuadrado o triangulo
        jmp principal

salir:
        mov eax, 1
        int 80h
