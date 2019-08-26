section .data
    msj db "Ingrese el tamano"
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

fila:
    mov al, [a]
    sub eax, '0'
    mov ecx, eax

    cmp ecx, 0
        jz salir
        jmp imprimirFila

col:
    cmp ecx, 0
        jz decFila
        jmp imprimirCol

decFila:
    mov al, [a]
    sub eax, '0'
    mov ecx, eax
    dec ecx
    add ecx, '0'
    mov [a], ecx
    jmp fila

imprimirCol:
    dec ecx
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, ast
    mov edx, 1
    int 80H
    pop ecx
    jmp col

imprimirFila:
    ;dec ecx
    ;add ecx, '0'
    ;mov [a], ecx
    ;mov eax, 4
    ;mov ebx, 1
    ;mov ecx, a
    ;mov edx, 2
    ;int 80H
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
    mov eax, 1
    mov ebx, 0
    int 80H
