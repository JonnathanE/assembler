%macro escribir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
    msj db "leer el archivo",10
    len EQU $-msj
    path db "/home/jonnathan/proyectos/assembler/leer_archivo/pruebita.txt", 0

section .bss
    texto resb 30
    idarchivo resd 1

section .text
    global _start

_start:
    ;*****   apertura del archivo
    mov eax, 5      ;servicio para abrir el archivo
    mov ebx, path   ;servicio de direccion del archivo
    mov ecx, 0      ; modo de acceso, read only = 0
    mov edx, 0      ; permisos del archivo
    int 0x80        ; igual al int 80H

    ; ** verificamos si el path es correcto o si existe
    test eax, eax
    jz salir

    ; **** archivo sin porblemas(excepciones) ****
    mov dword [idarchivo], eax  ; respaldo el id del archivo

    escribir msj, len

    mov eax, 3
    mov ebx, [idarchivo]      ; entrada estandar. (0,1,2 ) => entrada por teclado
    mov ecx, texto
    mov edx, 14
    int 80H

    escribir texto, 14

    ;*****   cerrar del archivo ***********************
    mov eax, 6              ;servicio para cerrar el archivo
    mov ebx, [idarchivo]    ;servicio de direccion del archivo
    mov ecx, 0              ; no se necesita modo de acceso
    mov edx, 0              ; no se necesita permisos
    int 0x80                ; igaul al int 80H

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
