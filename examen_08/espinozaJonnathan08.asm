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

    msjRes db "  =   veces, "
    lenRes EQU $-msjRes

    pathR db "/home/jonnathan/proyectos/assembler/examen_08/arreglo.txt", 0
    pathW db "/home/jonnathan/proyectos/assembler/examen_08/repeticiones.txt", 0
    
    msjNum db "Seleccione del 1 al 9: "
    lenmsjNum EQU $-msjNum

section .bss
    texto resb 10
    idarchivoR resd 1
    idarchivoW resd 1
    cont resb 10
    num resb 1

section .text
    global _start

_start:
    ; *********** READ DOC **************************
    ;*****   apertura del archivo
    mov eax, 5      ;servicio para abrir el archivo
    mov ebx, pathR   ;servicio de direccion del archivo
    mov ecx, 0      ; modo de acceso, read only = 0
    mov edx, 0      ; permisos del archivo
    int 0x80        ; igual al int 80H

    ; ** verificamos si el path es correcto o si existe
    test eax, eax
    jz salir

    ; **** archivo sin porblemas(excepciones) ****
    mov dword [idarchivoR], eax  ; respaldo el id del archivo

    escribir msj, len

    mov eax, 3
    mov ebx, [idarchivoR]      ; entrada estandar. (0,1,2 ) => entrada por teclado
    mov ecx, texto
    mov edx, 14
    int 80H


    ; ***************** STAR WRITE ***************************
    ;*****   apertura del archivo
    mov eax, 8      ;servicio para crear y escribir en archivo
    mov ebx, pathW   ;servicio de direccion del archivo
    mov ecx, 2      ; modo de acceso, write and read = 2
    mov edx, 200h      ; permisos del archivo
    int 0x80        ; igaul al int 80H

    ; ** verificamos si el path es correcto o si existe
    test eax, eax   ; test es un and sin modificar sus operandos, solo modifica  banderas
    jz salir

    ; **** archivo sin porblemas(excepciones) ****
    mov dword [idarchivoW], eax  ; respaldo el id del archivo

    ; ***************** ENTER NUMBER ******************
    
    escribir msjNum, lenmsjNum
    
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 2
    int 80H
    
    ; ***************** START COUNTERS *************************
    
    mov dh, [num]                           ; guardo el numero ingresado en dh para comparar
    sub dh, '0'

    mov ecx, 8                              ; inicio del contador del bucle
    mov esi, 0                              ; inicio el apuntador de la cadena del bucle
    
    
loop3:
    mov al, [texto+esi]                     ; obtengo el numero de la cadena
    sub al, '0'                             ; convierto el valor en numero

    inc esi                                 ; incremento el apuntador al siguiente numero de la cadena

    cmp dh, al                              ; comparo si es igual el numero ingresado con el numero actual
    jz incCont                              ; si es igual llamo a mi contador
    
endl3:
    loop loop3                              ; repito el bucle
    
    add dh, '0'                             ; convierto el valor ingresado en cadena
    mov [msjRes+0], dword dh                ; agrego dh en msjRest

    mov ah, [cont]                          ; obtengo contador
    add ah, '0'
    mov [msjRes+4], dword ah                ; agrego el contador en msjRes
    
    escribir msjRes, lenRes                 ; escribo el resultado en consola
    call writeText                          ; llamo a escribir el resultado en documento
    
    jmp cerrarArchivo                       ; salto a cerrar el archivo
    
    

incCont:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    jmp endl3

writeText:
    mov eax, 4
    mov ebx, [idarchivoW]      ; entrada estandar
    mov ecx, msjRes
    mov edx, 15
    int 80H
    ret

cerrarArchivo:
    mov eax, 6              ;servicio para cerrar el archivo
    mov ebx, [idarchivoR]    ;servicio de direccion del archivo
    mov ecx, 0              ; no se necesita modo de acceso
    mov edx, 0              ; no se necesita permisos
    int 0x80                ; igaul al int 80H

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
