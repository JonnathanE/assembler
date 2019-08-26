;Author: Jonnathan Damian Espinoza Erraez
section .data
    msja db "Ingrese un valor: "
    len_a EQU $-msja

    presentar_impar db 10, "Es impar"
    len_impar EQU $-presentar_impar

    presentar_par db 10, "Es par"
    len_par EQU $-presentar_par

section .bss
    a resb 1

section .text
    global _start

_start:

l1:
    mov eax, 4
    mov ebx, 1
    mov ecx, msja
    mov edx, len_a
    int 80H

    mov eax, 3
    mov ebx, 2
    mov ecx, a
    mov edx, 2
    int 80H

    ;Operacion
    mov ax, [a]
    sub ax,'0' ;convertir cadena a numero
    and ax, 1
    jz l1
    jmp salir

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
