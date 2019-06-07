section .data
    %assign signos '*'
    msj db 'Hola clase',signos,signos,signos,10
    len equ $-msj

section .text
    global _start

_start:
    ;Imprime el valor
    mov eax,4
    mov ebx,1
    mov ecx,msj
    mov edx,len
    int 80H
    
    ;salir
    mov eax,1
    mov ebx,0
    int 80H