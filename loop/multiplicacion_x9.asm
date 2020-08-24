;Alexis Cañar
;Multiplicaccion
;03-07-2020
;*****Macros*****
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro


section .data
        msj1 db " * "
        len_msj1 equ $-msj1

        msj2 db " = "
        len_msj2 equ $-msj2

        new_line db "",10
        len_new_line equ $-new_line

section .bss    
        a resb 2
        b resb 2
        c resb 2

section .text
        global _start

_start:
        mov bx, 1 
        mov cx, 1
        
       push bx
        
ciclo:
    
        push cx
        mov ax, bx
        mul cx
        add ax, '0'
        mov [c],ax
        
        add bx, '0'
        mov [a], bx
        
        add cx, '0'
        mov [b], cx
        
        imprimir a, 1
        imprimir msj1, len_msj1
        imprimir b,1
        imprimir msj2, len_msj2
        imprimir c,1    
        imprimir new_line,len_new_line
        
        pop cx
        ;inc bx
        inc cx
        cmp cx,10
        jnz ciclo
        mov bx, cx
        mov cx, 1
        

        mov eax,1
        int 80h
