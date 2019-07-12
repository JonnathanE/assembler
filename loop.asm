section .data
    numero db 'numero: x', 10
    len EQU $-numero
    
section .text
    global _start
    
_start:
    mov ecx, 9
    
l1:
    push ecx
    call imprimir_texto
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