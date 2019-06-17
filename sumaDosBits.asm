;Author: Jonnathan Damian Espinoza Erraez
section .data
    msja db "Ingrese el primer valor: "
    len_a EQU $-msja
    
    msjb db "Ingrese el segundo valor: "
    len_b EQU $-msjb
    
    presentar db 10, "***  Igual : "
    len_p EQU $-presentar
    
section .bss
    a resd 1
    b resd 1
    resultado resd 1
    aux resd 1
    
section .text
    global _start
    
_start:
    ;Ingresa el primer valor
    mov eax, 4
    mov ebx, 1
    mov ecx, msja
    mov edx, len_a
    int 80H
    
    mov eax, 3
    mov ebx, 2
    mov ecx, a
    mov edx, 3
    int 80H
    
    ;Ingresa el segundo valor
    mov eax, 4
    mov ebx, 1
    mov ecx, msjb
    mov edx, len_b
    int 80H
    
    mov eax, 3
    mov ebx, 2
    mov ecx, b
    mov edx, 3
    int 80H

sumaDosBit:
    ;Operacion
    mov al, [a+0]
    mov bl, [b+0]
    sub al,'0' ;convertir cadena a numero
    sub bl,'0'
    add al,bl
    add al,'0'
    mov [resultado],al
    
    
    ;Presentar resultado
    mov [presentar], dword 'Suma'
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H
    
    mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,2
    int 80H
    
    mov al, [a+1]
    mov bl, [b+1]
    sub al,'0' ;convertir cadena a numero
    sub bl,'0'
    add al,bl
    add al,'0'
    mov [resultado],al
    
    mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,2
    int 80H
    
salir:
    mov eax, 1
    mov ebx, 0
    int 80H