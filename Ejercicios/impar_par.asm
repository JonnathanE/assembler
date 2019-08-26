;Author: Jonnathan Damian Espinoza Erraez
section .data
    msja db "Ingrese un valor: "
    len_a EQU $-msja

    presentar_impar db 10, "Es impar"
    len_impar EQU $-presentar_impar

    presentar_par db 10, "Es par"
    len_par EQU $-presentar_par

section .bss
    a resd 1

section .text
    global _start

_start:

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
    add ax, 1
    JP par
    JNP impar




impar:
    mov eax,4
    mov ebx,1
    mov ecx,presentar_impar
    mov edx,len_impar
    int 80H

    jmp salir

par:
    mov eax,4
    mov ebx,1
    mov ecx,presentar_par
    mov edx,len_par
    int 80H

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
