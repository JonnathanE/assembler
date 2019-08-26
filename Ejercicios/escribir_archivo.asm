%macro escribir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
    msj db "Escribir el archivo",10
    len EQU $-msj
    path db "/home/jonnathan/proyectos/assembler/leer_archivo/pruebita02.txt", 0

section .bss
    texto resb 30
    idarchivo resd 1

section .text
    global _start

_start:
    ;*****   apertura del archivo
    mov eax, 8      ;servicio para crear y escribir en archivo
    mov ebx, path   ;servicio de direccion del archivo
    mov ecx, 2      ; modo de acceso, write and read = 2
    mov edx, 200h      ; permisos del archivo
    int 0x80        ; igaul al int 80H

    ; ** verificamos si el path es correcto o si existe
    test eax, eax   ; test es un and sin modificar sus operandos, solo modifica  banderas
    jz salir

    ; **** archivo sin porblemas(excepciones) ****
    mov dword [idarchivo], eax  ; respaldo el id del archivo

    escribir msj, len

    ; entrada por teclado
    mov eax, 3
    mov ebx, 2      ; entrada estandar
    mov ecx, texto
    mov edx, 15
    int 80H

    ;   escribir en el archivo
    mov eax, 4
    mov ebx, [idarchivo]      ; entrada estandar
    mov ecx, texto
    mov edx, 15
    int 80H

    ;escribir texto, 14

    ;*****   cerrar del archivo ***********************
    ;mov eax, 6              ;servicio para abrir el archivo
    ;mov ebx, [idarchivo]    ;servicio de direccion del archivo
    ;mov ecx, 0              ; modo de acceso, read only = 0
    ;mov edx, 0              ; permisos del archivo
    ;int 0x80                ; igaul al int 80H

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
