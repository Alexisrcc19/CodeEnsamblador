; Cuadrado con Pilas
; Alexis Rolando Cañar COrrea
%macro imprimir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1        ;Variable 1
	mov edx, %2        ;Variable 2
	int 80h
%endmacro

section .data
        asterisco db '*'
        nlinea		db		10,'' ; el 10 sirve para dat un salto de linea
        lnlinea		equ		$ - nlinea
    
section .text
        global _start
    
_start:
        
        mov rcx, 5 ;filas
        mov rdx, 5 ; columnas
       
cuadrado:
        push rcx
        cmp rcx,0
        jz salir
        jmp presentar

        
presentar:
        dec rdx
        push rdx
        imprimir asterisco,1
        pop rdx
        cmp rdx,0
        jg presentar; jg, verifica que el primer operando sea mayor al segundo operando
        imprimir nlinea, lnlinea
        pop rcx
        dec rcx
        mov rcx,5
        jmp cuadrado
        
salir:
        mov eax,1
        int 80h
