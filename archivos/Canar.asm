; ALEXIS ROLANDO CAÑAR CORREA
; TEMA 3
; EXAMEN 4

%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

segment .data
	msj1 db "Archivo Fuente", 10
	len_msj1 equ $-msj1

	error_archivo db "Archivo NOT FOUND", 10
    len_error equ $-error_archivo
	
	repite_A db "A= ", 0
	len_repiteA equ $-repite_A
	
	repite_E db "E= ", 0
	len_repiteE equ $-repite_E
	
	repite_I db "I= ", 0
	len_repiteI equ $-repite_I
	
	repite_O db "O= ", 0
	len_repiteA equ $-repite_A
	
	repite_U db "U= ", 0
	len_repiteA equ $-repite_A
	
	linea db 10," ------------", 10
	len_linea equ $-linea
	
	archivo db "/home/alexisrcc19/Documentos/ensamblador/datos.txt"

segment .bss
	texto resb 30
	idarchivo resd 1
	vocal resb 2
	
	a resb 2
	e resb 2
	i resb 2
	o resb 2
	u resb 2

segment .text
	global _start

_start:
    
    mov eax, 0
    add eax, '0'
    mov [a], eax
    mov [e], eax
    mov [i], eax
    mov [o], eax
    mov [u], eax
    ;******************* LEEER ARCHIVO DATOS ***********************
	; ************************** abrir el archivo **************************
	mov eax, 5		;servicio para crear archivos, trabajar con archivos    ;operación de open
	mov ebx, archivo	; dirección del archivo
	mov ecx, 0		
	mov edx, 777h
	int 80h
	
	test eax, eax		
	jz error	
	
	mov dword [idarchivo], eax

	escribir msj1, len_msj1
	
	; ************************** leer el archivo **************************
	mov eax, 3
	mov ebx, [idarchivo]	
	mov ecx, texto		
	mov edx, 15
	int 80h
	
	escribir texto, 30
	
	; ************************** cerrar el archivo **************************
	mov eax, 6		; close
	mov ebx, [idarchivo]	
	mov ecx, 0		
	mov edx, 0
	int 80h
	
escribir_texto:

    mov al, [esi]
    sub al, '0'
    add esi, 1
    add edi, 1
    
    cmp al,a
    je aumentar_a
	cmp al,e
    je aumentar_e
    cmp al,i
    je aumentar_i
    cmp al,o
    je aumentar_o
    cmp al,u
    je aumentar_u
    
    cmp edi, 30
    jb reset
    
reset:
    mov esi, texto
    mov edi, 0
    jmp sumaa
 
sumaa:
    mov al, [vocal+1]
    mov ah, [esi]
    
    sub ah, '0'
    
    adc al, ah
    
    aaa
    pushf
    or al, 30h
    popf
    
    mov [vocal+1], al
    
        cmp edi,30
        jb escribir_vocales
        jmp sumaa
    
escribir_vocales:
        escribir repite_A,len_repiteA
        escribir a,2
        escribir linea,len_linea

        escribir repite_E,len_repiteE
        escribir e,2
        escribir linea,len_linea
        
        escribir repite_I,len_repiteI
        escribir i,2
        escribir linea,len_linea
        
        escribir repite_O,len_repiteO
        escribir o,2
        escribir linea,len_linea
        
        escribir repite_U,len_repiteU
        escribir u,2
        escribir linea,len_linea
        
        
aumentar_a:
        mov edx,[a]
        sub edx,'0'
        inc edx
        add edx, '0'
        mov [a],edx

        jmp escribir_texto
        
aumentar_e:
        mov edx,[e]
        sub edx,'0'
        inc edx
        add edx, '0'
        mov [e],edx

        jmp escribir_texto
        
aumentar_i:
        mov edx,[i]
        sub edx,'0'
        inc edx
        add edx, '0'
        mov [i],edx

        jmp escribir_texto
        
aumentar_o:
        mov edx,[o]
        sub edx,'0'
        inc edx
        add edx, '0'
        mov [o],edx

        jmp escribir_texto
        
aumentar_u:
        mov edx,[u]
        sub edx,'0'
        inc edx
        add edx, '0'
        mov [u],edx

        jmp escribir_texto
        
error: 
    escribir error_archivo, len_error
    
salir:
	mov eax, 1
	int 80h
	
	
