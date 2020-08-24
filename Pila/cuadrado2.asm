; Ejercicio de Pilas - CUADRADO
; Alexis ROlando Cañar COrrea
%macro imprimir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1        ;Variable 1
	mov edx, %2        ;Variable 2
	int 80h
%endmacro

section .data
        asterisco db '*'
        nlinea		db		10,10,0
        lnlinea		equ		$ - nlinea
    
section .text
        global _start
    
_start:
        mov rcx, 9
        mov rdx, 9
        
 cuadrado:
        cmp rdx,0
        jz salir
            
        cmp rcx,0
        jz columnas
            
        jmp filas
    ;Imprimir
filas:  
        dec rcx
        push rcx
        imprimir asterisco,1
        pop rcx
        cmp rcx,0
        jnz cuadrado

columnas:
        dec rdx
        push rdx
        imprimir nlinea, lnlinea
        pop rdx
        cmp rdx,0
        jnz cuadrado

salir:
        mov eax,1
        int 80h
