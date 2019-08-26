section .data
    msja db "Ingrese el primer valor:"
    lena EQU $-msja

    msjb db 10, "Ingrese el segundo valor:"
    lenb EQU $-msjb

    mensajito db 10,"**  Igual :"
    len EQU $-mensajito

section .bss
    a resb 1
    b resb 1

section .text
    global _start

_start:
    ;Ingrea el primer valor
    mov eax,4
    mov ebx,1
    mov ecx,msja
    mov edx,lena
    int 80H

    mov eax,3
    mov ebx,2
    mov ecx,a
    mov edx,2
    int 80H

    ;Ingresa el sugundo valor
    mov eax,4
    mov ebx,1
    mov ecx,msjb
    mov edx,lenb
    int 80H

    mov eax,3
    mov ebx,2
    mov ecx,b
    mov edx,2
    int 80H

    mov al, [a]
    mov bl, [b]
    sub al,'0' ;convertir cadena a numero
    sub bl,'0'

    cmp al,bl
        jz igual
        jmp noIgual

igual:
    mov [mensajito], dword 'Si'
    mov eax,4
    mov ebx,1
    mov ecx,mensajito
    mov edx,len
    int 80H
    jmp salir

noIgual:
    mov [mensajito], dword 'No'
    mov eax,4
    mov ebx,1
    mov ecx,mensajito
    mov edx,len
    int 80H
    ;jmp salir

salir:
    mov eax,1
    mov ebx,0
    int 80H
