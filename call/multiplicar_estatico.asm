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
	a resb 2
	b resb 2
	c resb 2

section .text
	global _start

_start :
    mov al,3
    add al, '0'
    mov [a], al
    mov rcx,1
    
ciclo:   
    push rcx
    add rcx, '0'
    mov [b], rcx 
    
    mul rcx
    add al, '0'
    

    call imprimir_numero2
    call imprimir_numero3
    call imprimir_numero4
    call imprimir_numero5
    call imprimir_numero6
    call imprimir_numero7
    
        
	cmp cx,10
	jnz ciclo
	
	mov eax,1
	int 80h




imprimir_numero2:
    mov eax, 4
    mov ebx, 1
    mov ecx, a
    mov edx, 1
    int 80h
    ret

    mov eax,1
    int 80h

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

