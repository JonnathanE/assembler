section .data
    msj db "Ingrese el tamano: "
    len EQU $-msj
    
    ast db "* "
    
    salto db "", 10
    len_salto  EQU $-salto
    
section .bss
    a resb 1
    
section .text
    global _start
    
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len
    int 80H
    
    mov eax, 3
    mov ebx, 2
    mov ecx, a
    mov edx, 2
    int 80H
    
    mov al,[a]
	sub eax,'0'
	mov ecx, eax
	push ecx
    
fila:
    cmp ecx, 0
        jz salir
        push ecx
        jmp imprimirFila

col:
    cmp ecx, 0
        jz decFila
        jmp imprimirCol
        
decFila:
    pop ecx
    dec ecx
    jmp fila

imprimirCol:
    dec ecx
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, ast
    mov edx, 2
    int 80H
    pop ecx
    jmp col
        
imprimirFila:
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, len_salto
    int 80H
    
    mov al, [a]
    sub eax, '0'
    mov ecx, eax
    jmp col
    
    
salir:
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, len_salto
    int 80H
    
    mov eax, 1
    mov ebx, 0
    int 80H