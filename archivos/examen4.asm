%macro escribir 2
	mov eax,4  
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,3  
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	
	archivo db "/home/alexisrcc19/Documentos/ensamblador/datos.txt",0
	len_archivo equ $ - archivo

	error_archivo db "Error , el archivo no se encuentra , cambialo prro",0
	len_error equ $ - error_archivo

	repite0 db " 0 Se repite ",0
	len_repite0 equ $ - repite0

	repite1 db " 1 Se repite ",0
	len_repite1 equ $ - repite1

	repite2 db " 2 Se repite ",0
	len_repite2 equ $ - repite2

	repite3 db " 3 Se repite ",0
	len_repite3 equ $ - repite3

	repite4 db " 4 Se repite ",0
	len_repite4 equ $ - repite4

	repite5 db " 5 Se repite ",0
	len_repite5 equ $ - repite5

	repite6 db " 6 Se repite ",0	
	len_repite6 equ $ - repite6

	repite7 db " 7 Se repite ",0
	len_repite7 equ $ - repite7

	repite8 db " 8 Se repite ",0
	len_repite8 equ $ - repite8

	repite9 db " 9 Se repite ",0
	len_repite9 equ $ - repite9



	veces db "  veces ",0
	len_veces equ $ - veces

	usado db "  El texto usado fue:  ",0
	len_usado equ $ - usado

	linea db 10,"-------------------------",10
	len_linea equ $ - linea

	suma_numeros db "La suma de los numeros es : ",0
	len_suma_numeros equ $ - suma_numeros

section .bss
	idarchivo resb 1
	texto resb 20
	numero resb 2

	n0 resb 2
	n1 resb 2 
	n2 resb 2 
	n3 resb 2 
	n4 resb 2 
	n5 resb 2 
	n6 resb 2 
	n7 resb 2 
	n8 resb 2 
	n9 resb 2  

section .text
	global _start
_start:
	
	mov eax,0
	add eax,'0'
	mov [n0],eax
	mov [n1],eax
	mov [n2],eax
	mov [n3],eax
	mov [n4],eax
	mov [n5],eax
	mov [n6],eax
	mov [n7],eax
	mov [n8],eax
	mov [n9],eax
	
;*******************Lectura  archivo ***********************
	mov eax,5;se convoca una subrutina al sistema operativo :D
	mov ebx,archivo
	mov ecx,0
	mov edx,0
	int 80h
	;modos de acceso 
	;R-only = 0
	;w-only = 1
	;RDWR =2 

	test eax,eax ;bandera  zero = 0
	jz error

	mov dword [idarchivo],eax

	mov eax,3
	mov ebx,[idarchivo]
	mov ecx,texto
	mov edx,20;longitud
	int 80h

	

;*******************Repeticiones del numero  archivo ***********************

	mov esi,texto
	mov edi,0

	
escribir_texto:

	
	mov al,[esi]
	sub al,'0'
	add esi,1
	add edi,1

	
	
	cmp al,0
	je aumentar_0
	cmp al,1
	je aumentar_1
	cmp al,2
	je aumentar_2
	cmp al,3
	je aumentar_3
	cmp al,4
	je aumentar_4
	cmp al,5
	je aumentar_5
	cmp al,6
	je aumentar_6
	cmp al,7
	je aumentar_7
	cmp al,8
	je aumentar_8
	cmp al,9
	je aumentar_9
	
	cmp edi,20
	jb resetear

resetear :
	mov esi,texto
	mov edi,0
	jmp sumita

sumita:

	mov al, [numero + 1]
    mov ah, [esi]

    sub ah, '0'

    adc al, ah

    ;aaa
    pushf
    or al, 30h
    popf

    mov [numero + 1], al

	cmp edi,20
	jb escribir_numeros
	jmp sumita

 


escribir_numeros:
	

	escribir suma_numeros,len_suma_numeros
	escribir  numero,5
	escribir linea,len_linea
	
	escribir repite0,len_repite0
	escribir n0,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite1,len_repite1
	escribir n1,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite2,len_repite2
	escribir n2,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite3,len_repite3
	escribir n3,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite4,len_repite4
	escribir n4,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite5,len_repite5
	escribir n5,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite6,len_repite6
	escribir n6,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite7,len_repite7
	escribir n7,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite8,len_repite8
	escribir n8,2
	escribir veces,len_veces
	escribir linea,len_linea
	escribir repite9,len_repite9
	escribir n9,2
	escribir veces,len_veces
	escribir linea,len_linea
	
	escribir usado,len_usado
	escribir texto,20



;*******************Cerrar archivo ***********************
	mov eax,6
	mov ebx,[idarchivo]
	mov ecx,0
	mov edx,0;longitud
	int 80h


	jmp salir

aumentar_0:
	mov edx,[n0]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n0],edx
jmp escribir_texto
aumentar_1:
	mov edx,[n1]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n1],edx
jmp escribir_texto
aumentar_2:
	mov edx,[n2]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n2],edx
jmp escribir_texto
aumentar_3:
	mov edx,[n3]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n3],edx
jmp escribir_texto
aumentar_4:
	mov edx,[n4]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n4],edx
jmp escribir_texto
aumentar_5:
	mov edx,[n5]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n5],edx
jmp escribir_texto
aumentar_6:
	mov edx,[n6]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n6],edx
jmp escribir_texto
aumentar_7:
	mov edx,[n7]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n7],edx
jmp escribir_texto
aumentar_8:
	mov edx,[n8]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n8],edx
jmp escribir_texto
aumentar_9:
	mov edx,[n9]
	sub edx,'0'
	inc edx
	add edx,'0'
	mov [n9],edx
jmp escribir_texto


error:
	escribir error_archivo,len_error
salir:
	mov eax,1
	int 80h















