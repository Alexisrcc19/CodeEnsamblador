global  _main
extern	_printf,_scanf	;librerias de compilador gcc
section .data
	string: 	db "",0                          ;variable para palabra a ingresar
	mensaje1:	db "digite una palabra: ",0      ;mensaje para solicitar palabra
	formatin:	db "%s",0			 ;formato para ingreso de palabras
	formatout:	db "numero de vocales: %d", 10,0 ;formato de salida 
section .text
_main:
	push	ebx		;ingresamos a la pila el registro ebx
	
	push	mensaje1	;ingresamos a la pila el mensaje de solicitud
	call	_printf         ;llamamos a printf para que imprima el mensaje en pantalla
	add	esp,4		;desplazamos el esp
	
	push	string		;agregamos el campo de palabra a analizar
	push	formatin	;agregamos el formato de entrada 
	call	_scanf		;llamamos a scanf para leer lo que se digitó
	add	esp,8		;desplazamos el esp
	
	mov ebx,0		;limpiamos el registro
	mov edi,string		;pasamos la palabra almacenada en string a edi
	
comprobar:
	cmp 	BYTE[edi],''	;comparamos si el caracter es igual a vacio, si es verdad entonces salta a fin
	je	fin
	cmp 	BYTE[edi],'a'   ;comparamos si el caracter es igual a "a", si es verdad entonces suma 1 a ebx
	je 	sumar
	cmp 	BYTE[edi],'e'   ;comparamos si el caracter es igual a "e", si es verdad entonces suma 1 a ebx
	je 	sumar
	cmp 	BYTE[edi],'i'   ;comparamos si el caracter es igual a "i", si es verdad entonces suma 1 a ebx
	je 	sumar
	cmp 	BYTE[edi],'o'   ;comparamos si el caracter es igual a "o", si es verdad entonces suma 1 a ebx
	je	sumar
	cmp 	BYTE[edi],'u'   ;comparamos si el caracter es igual a "u", si es verdad entonces suma 1 a ebx
	je 	sumar
	jmp 	desplazar       ;sino es ninguno de los anteriores entonces salta a dezplazar
	
sumar:
	inc 	ebx		;incrementa en uno ebx que contiene el numero de vocales
	
desplazar:
	inc 	edi		;incrementa en uno edi que esta apuntando la posicion de 1 caracter en la palabra ingresada
	jmp 	comprobar	;luego del desplazamiento salta a comprobar nuevamente el nuevo caracter apuntado

fin:				
	push 	ebx		;ingresamos ebx a la pila
	push	formatout	;pasamos el formato de salida junto al valor que trae ebx(numero de vocales)
	call	_printf		;llamamos a printf para imprimir en pantalla
	add	esp, 8		;desplazamos el esp
	pop ebx			;y sacamos ebx de la pila
ret
