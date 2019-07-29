;   Examen 07
; Ingresar 10 numeros por teclado e invertirlos
; Autor: Jonnathan Espinoza
; 26 julio 2019

%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro
section .data
    msj db "Ingrese un numero y presione enter", 10
    len_msj EQU $-msj

    msj_res db "Resultado: ", 10
    len_msj_res EQU $-msj_res

    res db "  "

    salto_linea db " ", 10

    arreglo db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    len_arreglo EQU $-arreglo

section .bss
    resultado resb 2

section .text
    global _start

_start:
    ; inicio el arreglo
    mov esi, arreglo
    mov edi, 0

    ; escribir mensaje de ingresar numeros
    escribir msj, len_msj

leer:
    ;ingresar un numero por teclado
    mov eax, 3
    mov ebx, 2
    mov ecx, resultado
    mov edx, 2
    int 80H

    ; Guardo el numero en el arreglo
    mov al, [resultado]
    sub al, '0'
    mov [esi], al
    inc esi
    inc edi

    cmp edi, len_arreglo
    jb leer

    ; Escribo el mensaje de resultado
    escribir msj_res, len_msj_res

    mov ecx, 9

imprimir:

    push ecx
    mov al, [arreglo + ecx]
    add al, '0'
    mov [res], dword al

    escribir res, 2

    pop ecx
    dec ecx

    cmp ecx, -1
    jg imprimir

salir:
    escribir salto_linea, 2

    mov eax, 1
    mov ebx, 0
    int 80H
