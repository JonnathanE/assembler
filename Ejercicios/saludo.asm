 section .data
    saludo db 'Hola ensamblador',0xa
    msguno db 'lenguaje ensamblador',0xa
    msgdos db 'sexto ciclo b', 0xa
    msgtres db 'jonnathan', 0xa
    len EQU $-saludo ;calcular el tamano de la variable saludo
    lenuno EQU $-msguno
    lendos EQU $-msgdos
    lentres EQU $-msgtres


section .text
    global _start

_start:
    mov eax, 04  ;ax define el tipo de operacion(4=write)
    mov ebx, 01  ;bx define la unidad estandar(salida de caracteres)
    mov ecx, saludo  ;cx se almacena la referencia de la constante saludo para imprimir
    mov edx, len   ;dx define el # caracteres q se va imprimir
    int 80H ;interrupcion

    mov eax, 1 ;ax define el tipo de operacion(1=salir)
    mov ebx,0
    int 80H

    mov eax, 04  ;ax define el tipo de operacion(4=write)
    mov ebx, 01  ;bx define la unidad estandar
    mov ecx, msguno  ;cx se almacena la referencia de la constante saludo para imprimir
    mov edx, lenuno   ;dx define el # caracteres q se va imprimir
    int 80H ;interrupcion

    mov eax, 1 ;ax define el tipo de operacion(1=salir)
    mov ebx,0
    int 80H

    mov eax, 04  ;ax define el tipo de operacion(4=write)
    mov ebx, 01  ;bx define la unidad estandar
    mov ecx, msgdos  ;cx se almacena la referencia de la constante saludo para imprimir
    mov edx, lendos   ;dx define el # caracteres q se va imprimir
    int 80H ;interrupcion

    mov eax, 1 ;ax define el tipo de operacion(1=salir)
    mov ebx,0
    int 80H

    mov eax, 04  ;ax define el tipo de operacion(4=write)
    mov ebx, 01  ;bx define la unidad estandar
    mov ecx, msgtres  ;cx se almacena la referencia de la constante saludo para imprimir
    mov edx, lentres   ;dx define el # caracteres q se va imprimir
    int 80H ;interrupcion

    mov eax, 1 ;ax define el tipo de operacion(1=salir)
    mov ebx,0
    int 80H
