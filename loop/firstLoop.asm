; Alexis Rolando Cañar Correa
; 6to"A"
%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro        

section .data
        saludo db ". Hello World",10
        len_saludo equ $-saludo 
section .bss
        numero resb 1
        
section .txt
        global _start

_start:
        mov rcx, 10
       
for:
        push rcx
        add rcx, '0'
        mov [numero], rcx
        imprimir numero, 1
        imprimir saludo, len_saludo
        pop rcx
        loop for ; se repite las veces que le espcifico cx
        
salir:
        mov eax, 1
        int 80h
       
