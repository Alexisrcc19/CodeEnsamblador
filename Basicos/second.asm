 
section .data
	nombres db "Alexis ROlando",10   
	lenNombre EQU $-nombres     

	apellidos db "Cañar Correa",10   
	lenApellidos EQU $-apellidos
	
	materia db "ENSAMBLADOR",10   
	lenMateria EQU $-materia
	
	genero db "M",10   
	lenGenero EQU $-genero

section .text
	global _start
_start:
	;********* imprimir el mensaje ************
	mov eax, 4              
	mov ebx, 1	        
	mov ecx, nombres	
	mov edx, lenNombre	
	int 80H			; interrupción de SW para el SO Linux
	
	mov eax, 4              
	mov ebx, 1	        
	mov ecx, apellidos	
	mov edx, lenApellidos	
	int 80H			; interrupción de SW para el SO Linux
	
	mov eax, 4              
	mov ebx, 1	        
	mov ecx, materia	
	mov edx, lenMateria	
	int 80H			; interrupción de SW para el SO Linux
	
	mov eax, 4              
	mov ebx, 1	        
	mov ecx, genero	
	mov edx, lenMateria	
	int 80H			; interrupción de SW para el SO Linux
	
	mov eax, 1		; salida del programa, system_exit,sys_exit
	mov ebx, 0		; si el retorno es 0 (200 en la web) ok
	int 80H
