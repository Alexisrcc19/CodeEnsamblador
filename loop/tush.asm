%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro


section .data

msg1 db " * "
len_msj1 equ $-msg1	

msg2 db " = "
len_msj2 equ $-msg2	

nueva_linea db '',10
len_nueva equ $-nueva_linea	

section .bss
    numero1 resb 1
    numero2 resb 2
    resultado resb 2

section .text
        global _start

_start:

    mov dx,1
    add dx,'0'
    mov [numero1], dx
    mov cx,1
    jmp proceso

incremento:

    imprimir nueva_linea, len_nueva
    mov dx,[numero1]  ;Almacena en dx el valor del numero 1
    inc dx     
    mov[numero1],dx 
    mov cx,1   ;Reinicia CX
    cmp dx,'9' ;Compara DX  y 9
    jg salir  
    jnz proceso 
    
proceso:
    push cx
    mov ax,[numero1]
    sub ax,'0'
    mul cx
    add al,'0'
    add ah,'0'
    mov [resultado],ah ;Almacena el valor de AH en la direccion de memoria 0 de la variable producto
    mov [resultado],al ; """""""""""""""""""""""""""""""""""""""""""""""" 1 """""""""""""""""""" 
    add cx,'0'
    mov [numero2],cx ;Mueve en valor de CX al Numero 2 
    imprimir numero1,1
    imprimir msg1,len_msj1
    imprimir numero2, 1
    imprimir msg2,len_msj2
    imprimir resultado,1
    imprimir nueva_linea, len_nueva
    pop cx
    inc cx
    cmp cx,10   
    jnz proceso   ;Si no es igual repite el ciclo
    jz incremento ;Si es igual salta a incremento

salir:
    mov eax,1
    int 80h