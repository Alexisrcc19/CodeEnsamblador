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
	msj1 db "* "
	len_msj1 equ $-msj1
	
	msj2 db "= "
	len_msj1 equ $-msj2
	
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
    
    
    imprimir  a,1
    imprimir msj1,len_msj1
    imprimir  b,1
    imprimir msj2, len_msj2
    imprimir new_line,1
    pop rcx
    inc rcx
    
	cmp cx,10
	jnz ciclo
	
	mov eax,1
	int 80h
	

