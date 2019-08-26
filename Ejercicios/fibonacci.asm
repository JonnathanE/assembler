section .data
    numero db '', 10
    len EQU $-numero

    msja db "Ingrese el valor:"
    lena EQU $-msja

section .bss
    a resb 1

section .text
    global _start

_start:

; pedir valores
    mov eax,4
    mov ebx,1
    mov ecx,msja
    mov edx,lena
    int 80H

    mov eax,3
    mov ebx,2
    mov ecx,a
    mov edx,3
    int 80H


    mov ecx, 1
    mov ebx, 1

;operacion
    add ecx, '0'
    mov [numero], dword ecx
    call imprimir_texto
    mov ebx, 1
    add ebx, '0'
    mov [numero], dword ebx
    call imprimir_texto
    mov ecx, [a]
    sub ecx, '0'
    mov eax, 1
    mov ebx, 1
    ;jmp salir

l1:
    push ecx
    push eax
    push ebx

    pop ebx
    pop eax
    push ebx

    add ebx, eax
    push ebx

    add ebx, '0'
    mov [numero], dword ebx
    call imprimir_texto

    pop ebx
    pop eax
    pop ecx
    loop l1
    jmp salir



imprimir_texto:
    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, len
    int 80H
    ret ; retorna a la ultima linea del llamado

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
