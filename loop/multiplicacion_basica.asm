; Multiplicacion de dos numeros estaticos, no se ingresa por teclado
; Alexis Rolando Cañar Correa
; 6to

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

section .bss
        a resb 1
        b resb 1
        multiplicacion resb 1
        

section .text
	   global _start

_start :
        mov ax,2
        add ax,'0'
        mov [a], bx
        mov rcx, 9
mult:
    
        push rcx
        mul rcx
        
        ;add rcx,'0'
        ;mov [b], rcx
        
        add eax, '0'
        mov [multiplicacion] , eax
        
        ;imprimir a, 1
        imprimir msj1, len_msj1
        imprimir [rcx],1
        imprimir msj2, len_msj2
        imprimir multiplicacion,1
        imprimir new_line,1
        
        pop rcx
        mov ax,2
        loop mult
        
        mov eax,1
        int 80h
	

