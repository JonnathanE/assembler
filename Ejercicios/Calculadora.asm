; calculadora, utilizando macro


%macro escribir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
    mensaje1 db 10, '--Calculadora--', 10
    len1 equ $-mensaje1

    mensaje2 db 10, 'Ingrese # 1: '
    len2 equ $-mensaje2

    mensaje3 db 10,'Ingresar #2: '
    len3 equ $-mensaje3

    mensaje4 db 10,'1. Sumar', 10
    len4 equ $-mensaje4

    mensaje5 db '2. Restar', 10
    len5 equ $-mensaje5

    mensaje6 db '3. Multiplicar', 10
    len6 equ $-mensaje6

    mensaje7 db '4. Dividir', 10
    len7 equ $-mensaje7

    mensaje8 db '5. Salir ', 10
    len8 equ $-mensaje8

    mensaje db 10,'Resultado:  '
    len equ $-mensaje

    mensajeR db 10, 'Residuo:  '
    lenR  equ $-mensajeR

    mensajeO db 10, 'Opcion Erronea',10
    lenO equ $-mensajeO

    mensajeS db 10, 'Seleccion: '
    lenS equ $-mensajeS

section .bss
    primero: resb 3
    segundo: resb 3
    seleccion: resb 3
    resultado: resb 3
    residuo: resb 3

section .text
    global _start

_start:
jmp lectura
    ;presento mensaje de Calculadora
    lectura:
    escribir mensaje1, len1


    ; Presento mensaje de primer numero
    escribir mensaje2, len2

    ;Obtengo el primer numero
    mov eax, 3
    mov ebx, 2
    mov ecx, primero
    mov edx, 3
    int 80h

     ; Presento mensaje de segundo numero
    escribir mensaje3, len3

    ;Obtengo el segundo numero
    mov eax, 3
    mov ebx, 2
    mov ecx, segundo
    mov edx, 3
    int 80h

    ;Presento opciones de Calculadora
    ;suma
    escribir mensaje4, len4

    ;resta
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje5
    mov edx, len5
    int 80h

    ;multilpicacion
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje6
    mov edx, len6
    int 80h

    ;division
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje7
    mov edx, len7
    int 80h

    ;salir
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje8
    mov edx, len8
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, mensajeS
    mov edx, lenS
    int 80h
    ;Obtener seleccion ingresada
    mov ebx, 0
	mov ecx, seleccion
	mov edx, 2
	mov eax, 3
	int 80h

    mov ah, [seleccion]; movemos la seleccio a ah
    sub ah, '0'; Convierte la cadena en #

    ; se realiza comparacion con cmp

    cmp ah,1
    je sumar

    cmp ah,2
    je restar

    cmp ah,3
    je multiplicar

    cmp ah,4
    je dividir

    cmp ah,5
    je salir

    ;opcion invalida
    mov eax, 4
    mov ebx, 1
    mov ecx, mensajeO
    mov edx, lenO
    int 80h
    jmp salir

sumar:
    mov al, [primero+0]
    mov bl, [segundo+0]

    sub al, '0'; Convierte la cadena en #
    sub bl, '0'; Convierte la cadena en #
    add al, bl

    add al, '0'; Conertir el # en cadena

    mov [resultado], al
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 3
    int 80h

    mov al, [primero+1]
    mov bl, [segundo+1]
    sub al, '0'; Convierte la cadena en #
    sub bl, '0'; Convierte la cadena en #
    add al, bl

    add al, '0'; Conertir el # en cadena


    mov [resultado], al

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 80h

    jmp salir


restar:
    mov ax, [primero]
    mov bx, [segundo]
    sub ax, '0'; Convierte la cadena en #
    sub bx, '0'; Convierte la cadena en #
    sub ax, bx

    add ax, '0'; Conertir el # en cadena

    mov [resultado], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 80h

    jmp salir

multiplicar:
    mov ax, [primero]
    mov bx, [segundo]
    sub ax, '0'; Convierte la cadena en #
    sub bx, '0'; Convierte la cadena en #
    mul bx

    add ax, '0'; Conertir el # en cadena

    mov [resultado], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 80h
    jmp salir

dividir:
    mov al, [primero]
    mov bl, [segundo]
    mov dx, 0
    mov ah, 0
    sub al, '0'; Convierte la cadena en #
    sub bl, '0'; Convierte la cadena en #
    div bl


    add al, '0'; Conertir el # en cadena
    add ah, '0'; Conertir el # en cadena



    mov [resultado], al

    mov [residuo], ah

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, mensajeR
    mov edx, lenR
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, residuo
    mov edx, 1
    int 80h


    jmp salir


salir:
    mov eax, 1
    int 80h





