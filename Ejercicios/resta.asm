section .data
    msja db "Ingrese el primer valor:"
    lena EQU $-msja

    msjb db 10, "Ingrese el segundo valor:"
    lenb EQU $-msjb

    presentar db 10, "La       es:"
    len_p EQU $-presentar

section .bss
    a resb 1
    b resb 1
    suma resb 1
    residuo resb 1
    cociente resb 1

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

    ;Operacion resta
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    sub ax,bx
    add ax,'0'
    mov [suma],ax

    mov [presentar+4], dword 'resta'

    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H

    mov eax,4
    mov ebx,1
    mov ecx,suma
    mov edx,1
    int 80H

    ;Operacion multiplicacion
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    mul bx
    add ax,'0'
    mov [suma],ax

    mov [presentar+4], dword 'Mult'

    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H

    mov eax,4
    mov ebx,1
    mov ecx,suma
    mov edx,1
    int 80H

    ;Operacion division
    mov al, [a]
    mov bl, [b]
    sub al,'0' ;convertir cadena a numero
    sub bl,'0'
    div bl
    add ah, '0'
    add al,'0'
    mov [cociente],al
    mov [residuo], ah

    mov [presentar+4], dword 'Div'

    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H

    mov eax,4
    mov ebx,1
    mov ecx,cociente
    mov edx,1
    int 80H

    mov [presentar+4], dword 'Residuo'

    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H

    mov eax,4
    mov ebx,1
    mov ecx,residuo
    mov edx,1
    int 80H

    mov eax,1
    mov ebx,0
    int 80H
