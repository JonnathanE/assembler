section .data
    mensaje_1 db "Ingrese una opcion:"
    len_m1 EQU $-mensaje_1

    mensaje_op1 db 10,"1   suma"
    len_1 EQU $-mensaje_op1

    mensaje_op2 dq 10,"2   resta"
    len_2 EQU $-mensaje_op2

    mensaje_op3 dq 10,"3   multiplicacion"
    len_3 EQU $-mensaje_op3

    mensaje_op4 dq 10,"4   division"
    len_4 EQU $-mensaje_op4

    mensaje_op5 dq 10,"5   salir"
    len_5 EQU $-mensaje_op5

    msja db "Ingrese el primer valor:"
    lena EQU $-msja

    msjb db 10, "Ingrese el segundo valor:"
    lenb EQU $-msjb

    presentar db 10, "***  Igual :"
    len_p EQU $-presentar

section .bss
    opcion resb 1
    a resb 1
    b resb 1
    resultado resb 1

section .text
    global _start


_start:

opciones:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_1
    mov edx, len_m1
    int 80H

    ;mov [mensaje_2], dword '2'
    ;mov [mensaje_3], qword '1  suma'

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_op1
    mov edx, len_1
    int 80H

    ;mov [mensaje_2], dword '2'
    ;mov [mensaje_2+4], dword 'rest'

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_op2
    mov edx, len_2
    int 80H

    ;mov [mensaje_2+4], dword 'mult'

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_op3
    mov edx, len_3
    int 80H

    ;mov [mensaje_2+4], dword 'div'

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_op4
    mov edx, len_4
    int 80H

    ;mov [mensaje_2+4], dword 'exit'

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_op5
    mov edx, len_5
    int 80H

    mov eax, 3
    mov ebx, 2
    mov ecx, opcion
    mov edx, 2
    int 80H

    mov al, [opcion]
    sub al, '0'

    cmp al, 1
        jz suma

    cmp al, 2
        jz resta

    cmp al, 3
        jz multiplicacion

    cmp al, 4
        jz division

    cmp al, 5
        jz salir

    jmp opciones

suma:
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

    ;Operacion
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    add ax,bx
    add ax,'0'
    mov [resultado],ax

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
    mov edx,1
    int 80H

    jmp opciones


resta:
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

    ;Operacion
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    sub ax,bx
    add ax,'0'
    mov [resultado],ax

    ;Presentar resultado
    mov [presentar], dword 'Rest'
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H

    mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,1
    int 80H

    jmp opciones


multiplicacion:
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

    ;Operacion
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    mul bx
    add ax,'0'
    mov [resultado],ax

    ;Presentar resultado
    mov [presentar], dword 'Mult'
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H

    mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,1
    int 80H

    jmp opciones

division:
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

    ;Operacion
    mov al, [a]
    mov bl, [b]
    sub al,'0' ;convertir cadena a numero
    sub bl,'0'
    div bl
    add ah, '0'
    add al,'0'
    mov [resultado],al

    ;Presentar resultado
    mov [presentar], dword 'Div'
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H

    mov eax,4
    mov ebx,1
    mov ecx,resultado
    mov edx,1
    int 80H

    jmp opciones

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
