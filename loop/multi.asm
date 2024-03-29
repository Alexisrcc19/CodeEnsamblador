%macro imprimira 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro presentar 3
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,2
	int 80h
    imprimira asterisco, len_asterisco
    mov eax,4
	mov ebx,1
	mov ecx,%2
	mov edx,1
	int 80h
    imprimira igual, len_igual
    mov eax,4
	mov ebx,1
	mov ecx,%3
	mov edx,2
	int 80h
    imprimira salto, len_salto
%endmacro 

section .data
;    nombres DB "Estudiante: Jhon Faver Henao Saldarriaga", 10 
    len_nombres EQU  $ - nombres 
    
    curso DB "Curso: 6to 'A'", 10 
    len_curso EQU  $ - curso 

    fecha DB "03-08-2020", 10 ;
    len_fecha EQU  $ - fecha ;

    resultado db 'El resultado de la multiplicacion es:'
    len_resultado equ $ - resultado

    igual db ' = '
    len_igual equ $ - igual

    asterisco db ' * '
    len_asterisco equ $ - asterisco
    
    salto db 10
    len_salto equ $ - salto

section .bss
    num1 resb 3
    num2 resb 3
    producto resb 2

section .text
        global _start

_start:

    imprimira nombres, len_nombres
    imprimira curso, len_curso
    imprimira fecha, len_fecha
    imprimira salto, len_salto

    mov dx,1
    add dx,'0'
    mov [num1], dx
    mov cx,1
    jmp ciclo

incremento:

    imprimira salto, len_salto
    mov dx,[num1]  ;Almacena en dx el valor del numero 1
    inc dx     
    mov[num1],dx 
    mov cx,1   ;Reinicia CX
    cmp dx,'9' ;Compara DX  y 9
    jg salir  
    jnz ciclo 
    
ciclo:
    push cx
    mov ax,[num1]
    sub ax,'0'
    mul cx
    add al,'0'
    add ah,'0'
    mov [producto],ah ;Almacena el valor de AH en la direccion de memoria 0 de la variable producto
    mov [producto],al ; """""""""""""""""""""""""""""""""""""""""""""""" 1 """""""""""""""""""" 
    add cx,'0'
    mov [num2],cx ;Mueve en valor de CX al Numero 2 
    presentar num2,num1,producto
    pop cx
    inc cx
    cmp cx,10   
    jnz ciclo   ;Si no es igual repite el ciclo
    jz incremento ;Si es igual salta a incremento

salir:
    mov eax,1
    int 80h
