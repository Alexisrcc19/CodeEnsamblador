%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section	.data
msg db "El factorial es :"	
len_msg equ $ - msg	
nueva_linea db 10,'',10
len_nueva equ $-nueva_linea	

section .bss
fact resb 1

section	.text
   global _start        
	
_start:                 

   mov bx, 3            ;para calcular el factorial 3
   call  proc_fact
   add   ax, '0'
   mov  [fact], ax
    
   imprimir msg,len_msg

   imprimir fact,1
   imprimir nueva_linea,len_nueva
   mov	  eax,1        
   int	  80h           
	
proc_fact:
   cmp   bl, 0
   jg    do_calculation
   mov   ax, 1
   ret
	
do_calculation:
   dec   bl
   call  proc_fact
   inc   bl        ;Incrementamos el valor de bl  en el  registro
   mul   bl        ;ax = al * bl
   ret

