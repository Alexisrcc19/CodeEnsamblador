;Alexis Cañar
;Tabla de Multiplicar
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
        d resb 2

section .text
        global _start

_start:
        mov bx, 1 
        mov cx, 1
        push bx
        
ciclo1:
        
        push cx
        mov ax, bx
        mul cx
        add ax, '0'
        mov [c],ax
        
        ;pop bx
        add bx, '0'
        mov [a], bx
        
        
        add cx, '0'
        mov [b], cx
        
        call imprimir_numero2
        call imprimir_numero3
        call imprimir_numero4
        call imprimir_numero5
        call imprimir_numero6
        call imprimir_numero7
        
        pop cx
        inc cx
        cmp cx,10
        
        jnz ciclo1
        jz ciclo2
        
ciclo2:
        mov cx, 1
        pop bx
        inc bx
        push bx
        cmp bx,10
        ;imprimir new_line,len_new_line
        jnz ciclo1
        jz salir
       
       
imprimir_numero2:
    mov eax, 4
    mov ebx, 1
    mov ecx, a
    mov edx, 1
    int 80h
    ret

imprimir_numero3:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len_msj1
    int 80h
    ret

imprimir_numero4:
    mov eax, 4
    mov ebx, 1
    mov ecx, b
    mov edx, 1
    int 80h
    ret

imprimir_numero5:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len_msj2
    int 80h
    ret

imprimir_numero6:
    mov eax, 4
    mov ebx, 1
    mov ecx, c
    mov edx, 1
    int 80h
    ret

imprimir_numero7:
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, 1
    int 80h
    ret

salir:       
        mov eax,1
        int 80h
