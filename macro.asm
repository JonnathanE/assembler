; macro
; Autor: Jonnathan Espinoza
; 022 julio 2019

%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro

section .data
    msj1 db "Ingrese numero y presione enter", 10
    len_msj1 EQU $-msj1

    msj2 db "Ingrese numero y presione enter", 10
    len_msj2 EQU $-msj2

section .text
    global _start

_start:

    escribir msj1, len_msj1

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
