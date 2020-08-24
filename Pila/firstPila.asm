; Ejercicio de Pilas
; Alexis ROlando Cañar COrrea
section .data
        asterisco db '*'
    
section .text
        global _start
    
_start:
        mov rcx, 9

    
    ;Imprimir
imprimir:  
    dec rcx
    push rcx
    mov eax,4
    mov ebx,1
    mov rcx, asterisco
    mov edx,1
    int 80h
    pop rcx
    cmp rcx,0
    jnz imprimir
    
    ;Salir
    mov eax,1
    int 80h
