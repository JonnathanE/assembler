;Author: Jonnathan Damian Espinoza Erraez
section .data
    msja db "Ingrese el primer valor: "
    len_a EQU $-msja
    
    msjb db "Ingrese el segundo valor: "
    len_b EQU $-msjb
    
    presentar_igual db 10, "Son Iguales"
    len_igual EQU $-presentar_igual
    
    presentar_mayor db 10, "El primer es mayor"
    len_mayor EQU $-presentar_mayor
    
    presentar_menor db 10, "El primer es menor"
    len_menor EQU $-presentar_menor
    
section .bss
    a resd 1
    b resd 1
    
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
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msjb
    mov edx, len_b
    int 80H
    
    mov eax, 3
    mov ebx, 2
    mov ecx, b
    mov edx, 2
    int 80H


    ;Operacion
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    
    cmp ax, bx
        jz iguales
    
    cmp ax, bx
        jg mayor
    
    cmp ax, bx
        jc menor
    
iguales:
    mov eax,4
    mov ebx,1
    mov ecx,presentar_igual
    mov edx,len_igual
    int 80H
    
    jmp salir

mayor:
    mov eax,4
    mov ebx,1
    mov ecx,presentar_mayor
    mov edx,len_mayor
    int 80H
    
    jmp salir

menor:
    mov eax,4
    mov ebx,1
    mov ecx,presentar_menor
    mov edx,len_menor
    int 80H
    
salir:
    mov eax, 1
    mov ebx, 0
    int 80H