; 26/07/2019

%macro escribir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
    msg db 'La suma es: ', 10
    len equ $-msg
    num1 db '518'
    num2 db '197'
    sum db '    '

section .text
    global _start
 
 _start:
    mov ecx, 3
    mov esi, 2
    clc         ;instruccion, CF = 0

ciclo_suma:
    mov al, [num1 + esi]
    adc al, [num2 + esi]
    aaa                     ; ajustado: volvemos el estado original del carry en sumas
    pushf                   ; guarda en pila todos los valores de las banderas
    
    or al, 30h              ; 30h -> 48.. la oepracion modifica al operando
                            ; add 48, add '0'
    
    mov [sum + esi], al
    dec esi
    popf
    loop ciclo_suma
    
    escribir msg, len
    escribir sum, 3
    
salir:
    mov eax, 1
    mov ebx, 0
    int 80H