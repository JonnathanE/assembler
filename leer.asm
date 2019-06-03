section .data
    msj db "Ingrese su nombre:", 10
    len EQU $-msj
    presentar db "nombre ingresado", 10
    len_p EQU $-presentar
    
section .bss
    nombre resb 10
    
section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msj
    mov edx,len
    int 80H
    
    mov eax,3
    mov ebx,2
    mov ecx,nombre
    mov edx,10
    int 80H
    
    mov eax,4
    mov ebx,1
    mov ecx,presentar
    mov edx,len_p
    int 80H
    
    mov eax,4
    mov ebx,1
    mov ecx,nombre
    mov edx,10
    int 80H
    
    mov eax,1
    mov ebx,0
    int 80H