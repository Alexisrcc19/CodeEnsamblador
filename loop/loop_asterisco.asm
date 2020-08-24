;Ejercicio loop cuadrado-trinagulo asterisco
;Alexis Cañar
;6 A
;20-julio-2020

%macro escritura 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro

section .data
        asterisco db '*'
        new_line db 10,''

section .text
        global _start
_start:
        mov rcx, 10 
        mov rbx, 1

l1:
        push rcx
        push rbx
        escritura, new_line
        
        pop rcx
        push rcx

l2:
        push rcx
        escritura, asterisco
        pop rcx
        loop l2
        
        pop rbx
        pop rcx
        inc rbx
        loop l1

salir:
        mov eax, 1
        int 80h
