section .data
    msj db "*"
    len EQU $-msj
    
section .bss
    nombre resb 1
    res resb 1
    
section .text
    global _start
    
_start:

    mov ecx, 9
    
bucle:
    cmp ecx, 0
        jz salir
        jmp imprimir

imprimir:
    dec ecx
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len
    int 80H
    pop ecx
    jmp bucle
    
salir:
    mov eax, 1
    mov ebx, 0
    int 80H