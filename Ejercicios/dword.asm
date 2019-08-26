section .data
    mensaje db "Hola clase",10
    len EQU $-mensaje

section .text
    global _start

_start:
    ;Imprime el valor
    mov eax,4
    mov ebx,1
    mov ecx,mensaje
    mov edx,len
    int 80H

    ;cambio el mensaje->mov [mensaje+0], dword 'mala'
    mov [mensaje], dword 'mala'

    ;Imprime el valor
    mov eax,4
    mov ebx,1
    mov ecx,mensaje
    mov edx,len
    int 80H

    ;modifica el mensaje
    mov [mensaje+5], dword 'niña'

    ;Imprime el valor
    mov eax,4
    mov ebx,1
    mov ecx,mensaje
    mov edx,len
    int 80H

    ;salir
    mov eax,1
    mov ebx,0
    int 80H
