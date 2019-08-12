; resta de con acarreo
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
    msj db 'La resta es: ', 10
    len equ $-msj
    n1 db '518'
    n2 db '197'
    resta db '    '

section .text
    global _start

 _start:
    mov ecx, 3  ; numero de operaciones de resta
    mov esi, 2  ; posicion del digito en cada cadena n1 y n2
    clc         ; pone la bandera del carry en cero(apagada) .instruccion, CF = 0

ciclo_resta:
    mov al, [n1 + esi]
    sbb al, [n2 + esi]      ; resta (sbb). suma el acarreo a resta en binario
    aas                     ; ajusta la operacion binaria al sistema decimal
    pushf                   ; guarda en pila todos los valores de las banderas

    or al, 30h              ; 30h -> 48.. la oepracion modifica al operando
                            ; add 48, add '0'

    mov [resta + esi], al
    dec esi
    popf
    loop ciclo_resta

    escribir msj, len
    escribir resta, 3

salir:
    mov eax, 1
    int 80H
