; Leer de un archivo los valores para sumarlos y restarlos
; Autor: Jonnathan Espinoza
; 05 de agosto del 2019


%macro escribir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
    msj db "leer el primer valor: "
    len EQU $-msj
    path db "/home/jonnathan/proyectos/assembler/leer_archivo/a1.txt", 0

    msj2 db "leer el segundo valor: "
    len2 EQU $-msj2
    path2 db "/home/jonnathan/proyectos/assembler/leer_archivo/a2.txt", 0

    salto db 10,""
	lenSalto equ $-salto

    resta db '    '
    msjresta db 'La resta es: ', 10
    lenresta equ $-msjresta

    msjsuma db 'La suma es: ', 10
    lensuma equ $-msjsuma
    sum db '    '

section .bss
    a resb 3
    idarchivo resd 1

    b resb 3
    idarchivo2 resd 1

section .text
    global _start

_start:
    ;*****   apertura del archivo 1
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
    mov ecx, a
    mov edx, 3
    int 80H

    escribir a, 3

    ;*****   cerrar del archivo ***********************
    mov eax, 6              ;servicio para cerrar el archivo
    mov ebx, [idarchivo]    ;servicio de direccion del archivo
    mov ecx, 0              ; no se necesita modo de acceso
    mov edx, 0              ; no se necesita permisos
    int 0x80                ; igaul al int 80H

    ;##########################################################################################
    escribir salto, lenSalto

    ;*****   apertura del archivo 2
    mov eax, 5      ;servicio para abrir el archivo
    mov ebx, path2   ;servicio de direccion del archivo
    mov ecx, 0      ; modo de acceso, read only = 0
    mov edx, 0      ; permisos del archivo
    int 0x80        ; igual al int 80H

    ; ** verificamos si el path es correcto o si existe
    test eax, eax
    jz salir

    ; **** archivo sin porblemas(excepciones) ****
    mov dword [idarchivo2], eax  ; respaldo el id del archivo

    escribir msj2, len2

    mov eax, 3
    mov ebx, [idarchivo2]      ; entrada estandar. (0,1,2 ) => entrada por teclado
    mov ecx, b
    mov edx, 3
    int 80H

    escribir b, 3

    ;*****   cerrar del archivo ***********************
    mov eax, 6              ;servicio para cerrar el archivo
    mov ebx, [idarchivo]    ;servicio de direccion del archivo
    mov ecx, 0              ; no se necesita modo de acceso
    mov edx, 0              ; no se necesita permisos
    int 0x80                ; igaul al int 80H

    ; ##################################################################################################
    ; operacion resta

    mov ecx, 3  ; numero de operaciones de resta
    mov esi, 2  ; posicion del digito en cada cadena n1 y n2
    clc         ; pone la bandera del carry en cero(apagada) .instruccion, CF = 0

ciclo_resta:
    mov al, [a + esi]
    sbb al, [b + esi]      ; resta (sbb). suma el acarreo a resta en binario
    aas                     ; ajusta la operacion binaria al sistema decimal
    pushf                   ; guarda en pila todos los valores de las banderas

    or al, 30h              ; 30h -> 48.. la oepracion modifica al operando
                            ; add 48, add '0'

    mov [resta + esi], al
    dec esi
    popf
    loop ciclo_resta

    escribir salto, lenSalto
    escribir msjresta, lenresta
    escribir resta, 3

    ; ##################################################################################################
    ; operacion suma


    mov ecx, 3
    mov esi, 2
    clc

ciclo_suma:
    mov al, [a + esi]
    adc al, [b + esi]
    aaa                     ; ajustado: volvemos el estado original del carry en sumas
    pushf                   ; guarda en pila todos los valores de las banderas

    or al, 30h              ; 30h -> 48.. la oepracion modifica al operando
                            ; add 48, add '0'

    mov [sum + esi], al

    dec esi
    popf
    loop ciclo_suma

    escribir salto, lenSalto
    escribir msjsuma, lensuma
    escribir sum, 4


salir:
    escribir salto, lenSalto
    mov eax, 1
    int 80H
