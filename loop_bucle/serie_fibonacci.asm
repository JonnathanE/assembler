section .data
	numero db "Serie Fibonacci 1, "
	lenNumero equ $ -numero

	coma db " , "
	lenConma equ $-coma

	salto db 10,""
	lenSalto equ $-salto


section .bss
	numN resb 10
	numA resb 10
	resultado resb 10

section .text
	global _start

_start:
	;inicializamos la variable para que nos de el numero de columnas
leerN:
	;le damos los valores a las variables
	mov ecx,6
	mov eax,0
	mov ebx,1
	
	;guardamos los datos en pila 
	push eax
	push ebx
	push ecx
	call imprimirUno
	jmp operacionFibonacci

operacionFibonacci:
	
	pop ecx
	pop ebx
	pop eax

	push eax
	push ebx
	push ecx

	mov [numA],ebx

	add eax,ebx
	add eax,'0'
	mov [numN],eax

	mov eax,4
	mov ebx,1
	mov ecx,numN 
	mov edx, 5
	int 80H	

	mov eax,4
	mov ebx,1
	mov ecx,coma 
	mov edx,lenConma
	int 80H	

	pop ecx
	pop ebx
	pop eax
	mov eax,[numA]
	mov ebx,[numN]
	sub ebx,'0'

	push eax
	push ebx

	dec ecx
	push ecx
	loop operacionFibonacci
	jmp salir


imprimirUno:
	mov eax,4
	mov ebx,1
	mov ecx,numero
	mov edx,lenNumero
	int 80H	

	ret


salir:
	mov eax, 1
	mov ebx, 0
	int 80H