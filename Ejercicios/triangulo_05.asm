section .data
    asterisco db '* '
    nueva_linea db 10, ''
    blanco db '  '

section .text
    global _start

_start:
    mov ecx, 4
    mov ebx, 1

l1:
    push ecx
    push ebx
    dec ecx
    push ecx
    call imprimir_enter
    pop ecx
    mov ebx, ecx
    push ebx

l2:
    push ecx
    call imp_blanco
    pop ecx
    loop l2
    pop bx
    pop cx
    dec bx
    push bx
    push ecx
    push ecx
    call imprimir_asterisco
    pop ecx
    loop l2 ; ecx != 0
    pop ebx
    pop ecx
    inc ebx
    pop eax
    dec eax
    push ecx
    mov ecx, eax
    loop l1
    jmp salir

imprimir_asterisco:
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 2
    int 80H
    ret ; retorna a la ultima linea del llamado

imprimir_enter:
    mov eax, 4
    mov ebx, 1
    mov ecx, nueva_linea
    mov edx, 1
    int 80H
    ret ; retorna a la ultima linea del llamado

imp_blanco:
    mov eax, 4
    mov ebx, 1
    mov ecx, blanco
    mov edx, 2
    int 80H
    ret ; retorna a la ultima linea del llamado


salir:
    mov eax, 1
    mov ebx, 0
    int 80H
