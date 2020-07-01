;Div de dos numero estaticos
section .data
    resultado db 'El resultado del cociente es:',10
    len_resultado equ $-resultado
    residuo_resultado db 'El resultado del residuo es:',10
    len_resultado_residuo equ $-residuo_resultado
    new_line db " ",10
    len_new_line equ $-new_line

section .bss
    cociente resb 2 ;cuando no se nececita del enter
    residuo resb 2 ;cuando no se nececita del enter
section .text
    global _start
_start:
    mov al,9
    mov bh,6
    div bh ;eax=eax*ebx
    add al,'0' ;Ajuste para que haga la suma en ascii
    mov [cociente], al
    add ah,'0'
    mov [residuo], ah

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, len_resultado
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, cociente
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, residuo_resultado
    mov edx, len_resultado_residuo
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, residuo
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h

    mov eax, 1
    int 80h
