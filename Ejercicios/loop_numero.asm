
section .data
    nueva_linea db '',10

section .bss
    resultado resb 1

section .text
    global _start

_start:
    mov ecx, 9
    mov ebx, 1

; ************* ciclo para imprimir enters *********
l1:
    push ecx
    push ebx
    call imprimir_enter
    pop ecx
    push ecx


; ************* ciclo para imprimir numero por columna filas *********
l2:
    push ecx
    add ecx, '0'
    mov [resultado], ecx
    call imprimir_numero
    pop ecx
    loop l2

    pop ebx
    inc ebx
    pop ecx
    loop l1
    jmp salir

imprimir_enter:
    mov eax,4
	mov ebx,1
	mov ecx,nueva_linea
	mov edx,1
	int 80H
    ret

imprimir_numero:
    mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,1
	int 80H
    ret

salir:
	mov eax, 1
	mov ebx, 0
	int 80H
