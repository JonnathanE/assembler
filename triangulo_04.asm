section .data
    asterisco db '* '
    nueva_linea db 10, ''
    blanco db '  '
    
section .text
    global _start
    
_start:
    mov ecx, 4
    mov ebx, 3
    mov eax, 1
    
l1:
    push ecx
    push eax
    push ebx
    call imprimir_enter
    pop ebx
    pop eax
    pop ecx
    push ecx
    push eax
    mov ecx, ebx
    push ecx
    
l2:
    push ecx
    call imp_blanco
    pop ecx
    loop l2 ; ecx != 0
    pop ecx
    dec ecx
    pop eax
    push ecx
    mov ecx, eax
    push ecx
    

    push ecx
    call imprimir_asterisco
    pop ecx
    loop l2
    pop eax
    pop ebx
    pop ecx
    dec ecx
    inc ax
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