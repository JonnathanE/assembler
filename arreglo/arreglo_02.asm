; guarda e imprime el valor mayor de un arreglo
; 08 julio 2019

section .data
    msj db "Ingrese numero y presione enter", 10
    len_msj EQU $-msj
    
    arreglo db 0, 0, 0, 0, 0
    len_arreglo EQU $-arreglo

section .bss
    resultado resb 2

section .text
    global _start

_start:
    mov esi, arreglo
    mov edi, 0


    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len_msj
    int 80H
leer:    
    mov eax, 3
    mov ebx, 2
    mov ecx, resultado
    mov edx, 2
    int 80H
    
    mov al, [resultado]
    sub al, '0'
    mov [esi], al
    inc esi
    inc edi
    
    cmp edi, len_arreglo
    jb leer
    mov ecx, 0
    mov bl, 0
    
    
comparar:
    mov al, [arreglo+ecx]
    cmp al, bl
    jb contador ;jb activa carri
    mov bl, al

contador:
    inc ecx
    cmp ecx, len_arreglo
    jb comparar

imprimir:
    add bl, '0'
    mov [resultado], bl
    
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2
    int 80H
    
salir:
    mov eax, 1
    mov ebx, 0
    int 80H