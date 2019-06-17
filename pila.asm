section .data
    msj db "Ingrese nobre: "
    len EQU $-msj
    
section .bss
    nombre resb 1
    res resb 1
    
section .text
    global _start
    
_start:

    ;mov eax, 4
    ;mov ebx, 1
    ;mov ecx, msj
    ;mov edx, len
    ;int 80H
    
    mov ax, 3
    push ax
    mov ax, 4
    push ax
    
    pop bx
    add bx, '0'
    mov [res], bx
    
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 80H
    
    pop cx
    add cx, '0'
    mov [res], cx
    
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 80H
    
salir:
    mov eax, 1
    mov ebx, 0
    int 80H