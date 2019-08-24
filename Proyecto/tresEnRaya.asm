%macro escribir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
    msjStar db "Presione enter para comenzar",10
    lenStar EQU $-msjStar
    
    msjEnd db "END",10
    lenEnd EQU $-msjEnd
    
    msjWinJ1 db 0x1b,"[93m","Jugador 1 WINS!!",10, 0x1b,"[37m"
    lenmsjWinJ1 EQU $-msjWinJ1

    msjWinJ2 db 0x1b,"[93m","Jugador 2 WINS!!",10, 0x1b,"[37m"
    lenmsjWinJ2 EQU $-msjWinJ2

    salto db 10,' '
    
    msjFila db "Fila: "
    lenFila EQU $-msjFila
    
    msjCol db "Columna: "
    lenCol EQU $-msjCol

    msjJ1 db 0x1b,"[96m","Jugador 1",10, 0x1b,"[37m"
    lenJ1 EQU $-msjJ1
    
    msjJ2 db 0x1b,"[32m","Jugador 2",10, 0x1b,"[37m"
    lenJ2 EQU $-msjJ2
    
    fila1 db 0, 0, 0
    lenfila1 EQU $-fila1
    
    fila2 db 0, 0, 0
    lenfila2 EQU $-fila2
    
    fila3 db 0, 0, 0
    lenfila3 EQU $-fila3
    
    
section .bss
    cont resb 10
    inicio resb 1
    fila resb 1
    col resb 1
    pJ1 resb 1
    pJ2 resb 1
    
    resultado resb 2
    

section .text
    global _start

_start:
    ; ==================================== llenar las filas con un valor 9 =====================================
    ; ==========================================================================================================
    mov esi, fila1
    mov edi, 0
llenarF1:
    mov ah, 5
    mov [esi], ah
    inc esi
    inc edi
    cmp edi, lenfila1
    jb llenarF1
    
    mov esi, fila2
    mov edi, 0
llenarF2:
    mov ah, 5
    mov [esi], ah
    inc esi
    inc edi
    cmp edi, lenfila2
    jb llenarF2
    
    mov esi, fila3
    mov edi, 0
llenarF3:
    mov ah, 5
    mov [esi], ah
    inc esi
    inc edi
    cmp edi, lenfila3
    jb llenarF3
    
    
    ; ===================================== Iniciar el juego ==============================================
    ; =====================================================================================================
    
    
    escribir msjStar, lenStar
    mov eax, 3
    mov ebx, 2
    mov ecx, inicio
    mov edx, 1
    int 80H
    
    ;escribir msjJ2, lenJ2
    
    ; =================================    JUGADOR 1    ==================================================
    ; ====================================================================================================

    ; ************************* peidr col y row ******************************

IngresarNum:
    escribir msjJ1, lenJ1               ; mensaje "JUgador 1"
    escribir msjFila, lenFila           ; pide raw
    mov eax, 3
    mov ebx, 2
    mov ecx, fila                       ; guarda en fila
    mov edx, 2
    int 80H
    escribir msjCol, lenCol             ; piede col
    mov eax, 3
    mov ebx, 2
    mov ecx, col                        ; guarda en col
    mov edx, 2
    int 80H
    
    mov al, [fila]
    sub al, '0'
    
    cmp al, 1                           ; compara fila 1
        jz f1
    cmp al, 2                           ; compara fila 2
        jz f2
    cmp al, 3                           ; compara fila 3
        jz f3
    jmp salir


    
f1:                                     ; ingresa fila 1
    mov al, [col]
    sub al, '0'
    dec al
    cmp al, 0                           ; compara col 0
        jz col0F1
    cmp al, 1                           ; compara col 1
        jz col1F1
    cmp al, 2                           ; compara col 2
        jz col2F1
    jmp impMatriz

col0F1:                                 ; ingresa col 0 row 1
    mov ah, 1
    mov [fila1+0], ah
    mov ecx, 0
    call siEstaLlena
    call row01
    call row04
    jmp IngresarNumJ2
col1F1:                                 ; ingresa col 1 row 1
    mov ah, 1
    mov [fila1+1], ah
    mov ecx, 0
    call siEstaLlena
    call row01
    call row05
    jmp IngresarNumJ2
col2F1:                                 ; ingresa col 2 row 1
    mov ah, 1
    mov [fila1+2], ah
    mov ecx, 0
    call siEstaLlena
    call row01
    call row06
    jmp IngresarNumJ2


f2:                                     ; ingresa fila 2
    mov al, [col]
    sub al, '0'
    dec al
    cmp al, 0
        jz col0F2
    cmp al, 1
        jz col1F2
    cmp al, 2
        jz col2F2
    jmp impMatriz

col0F2:                                 ; ingresa col 0 row 2
    mov ah, 1
    mov [fila2+0], ah
    mov ecx, 0
    call siEstaLlena
    call row04
    jmp IngresarNumJ2
col1F2:                                 ; ingresa col 1 row 2
    mov ah, 1
    mov [fila2+1], ah
    mov ecx, 0
    call siEstaLlena                    ; eeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrooooooooooooooooorrrrrrrrrr
    jmp IngresarNumJ2
col2F2:                                 ; ingresa col 2 row 2
    mov ah, 1
    mov [fila2+2], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNumJ2
    
f3:                                     ; ingresa row 3
    mov al, [col]
    sub al, '0'
    dec al
    cmp al, 0
        jz col0F3
    cmp al, 1
        jz col1F3
    cmp al, 2
        jz col2F3
    jmp impMatriz

col0F3:                                 ; ingresa col 0 row 3
    mov ah, 1
    mov [fila3+0], ah
    mov ecx, 0
    call siEstaLlena
    call row04
    jmp IngresarNumJ2
col1F3:                                 ; ingresa col 2 row 3
    mov ah, 1
    mov [fila3+1], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNumJ2
col2F3:                                 ; ingresa col 3 row 3
    mov ah, 1
    mov [fila3+2], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNumJ2
    
    
    ; ==============================================    JUGADOR 2    =========================================================
    ; ========================================================================================================================

    ; ************************* peidr col y row ******************************

IngresarNumJ2:
    escribir msjJ2, lenJ2               ; mensaje "JUgador 1"
    escribir msjFila, lenFila           ; pide raw
    mov eax, 3
    mov ebx, 2
    mov ecx, fila                       ; guarda en fila
    mov edx, 2
    int 80H
    escribir msjCol, lenCol             ; piede col
    mov eax, 3
    mov ebx, 2
    mov ecx, col                        ; guarda en col
    mov edx, 2
    int 80H
    
    mov al, [fila]
    sub al, '0'
    
    cmp al, 1                           ; compara fila 1
        jz f1J2
    cmp al, 2                           ; compara fila 2
        jz f2J2
    cmp al, 3                           ; compara fila 3
        jz f3J2
    jmp IngresarNumJ2


    
f1J2:                                     ; ingresa fila 1
    mov al, [col]
    sub al, '0'
    dec al
    cmp al, 0                           ; compara col 0
        jz col0F1J2
    cmp al, 1                           ; compara col 1
        jz col1F1J2
    cmp al, 2                           ; compara col 2
        jz col2F1J2
    jmp impMatriz

col0F1J2:                                 ; ingresa col 0 row 1
    mov ah, 0
    mov [fila1+0], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum
col1F1J2:                                 ; ingresa col 1 row 1
    mov ah, 0
    mov [fila1+1], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum
col2F1J2:                                 ; ingresa col 2 row 1
    mov ah, 0
    mov [fila1+2], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum


f2J2:                                     ; ingresa fila 2
    mov al, [col]
    sub al, '0'
    dec al
    cmp al, 0
        jz col0F2J2
    cmp al, 1
        jz col1F2J2
    cmp al, 2
        jz col2F2J2
    jmp impMatriz

col0F2J2:                                 ; ingresa col 0 row 2
    mov ah, 0
    mov [fila2+0], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum
col1F2J2:                                 ; ingresa col 1 row 2
    mov ah, 0
    mov [fila2+1], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum
col2F2J2:                                 ; ingresa col 2 row 2
    mov ah, 0
    mov [fila2+2], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum
    
f3J2:                                     ; ingresa row 3
    mov al, [col]
    sub al, '0'
    dec al
    cmp al, 0
        jz col0F3J2
    cmp al, 1
        jz col1F3J2
    cmp al, 2
        jz col2F3J2
    jmp impMatriz

col0F3J2:                                 ; ingresa col 0 row 3
    mov ah, 0
    mov [fila3+0], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum
col1F3J2:                                 ; ingresa col 2 row 3
    mov ah, 0
    mov [fila3+1], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum
col2F3J2:                                 ; ingresa col 3 row 3
    mov ah, 0
    mov [fila3+2], ah
    mov ecx, 0
    call siEstaLlena
    jmp IngresarNum


; ===================================== Comparar si esta llena la matriz ============================================
; ===================================================================================================================
siEstaLlena:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero
        
        mov ecx, 3                          ; inicio contador del bulce
        mov esi, 0                          ; inicio apuntador

    CompF1:
        mov dl, [fila1+esi]
        ;sub dl, '0'
        inc esi
        cmp dl, 5
        jz incCont1
        endl1:
        loop CompF1

        mov ecx, 3
        mov esi, 0

    CompF2:
        mov dl, [fila2+esi]
        ;sub dl, '0'
        inc esi
        cmp dl, 5
        jz incCont2
        endl2:
        loop CompF2
        
        mov ecx, 3
        mov esi, 0

    CompF3:
        mov dl, [fila3+esi]
        ;sub dl, '0'
        inc esi
        cmp dl, 5
        jz incCont3
        endl3:
        loop CompF3


        ;escribir cont,1

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 0
        jz impMatriz
        ret

incCont1:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    jmp endl1
incCont2:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    jmp endl2
incCont3:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    jmp endl3

; ===================================== VERIFICAR TRES EN RAYA =================================
; ==============================================================================================

; ********************* verifica las filas *************************
row01:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov ecx, 3                          ; inicio contador del bulce
        mov esi, 0                          ; inicio apuntador

    compRow01:
        mov dl, [fila1+esi]
        inc esi
        mov dh, 1
        cmp dl, 1
            jz incContRow
        endcompRow01:
        loop compRow01

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret

row02:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov ecx, 3
        mov esi, 0

    compRow02:
        mov dl, [fila2+esi]
        inc esi
        mov dh, 2
        cmp dl, 1
            jz incContRow
        endcompRow02:
        loop compRow02

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret

row03:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov ecx, 3
        mov esi, 0

    compRow03:
        mov dl, [fila3+esi]
        inc esi
        mov dh, 3
        cmp dl, 1
            jz incContRow
        endcompRow03:
        loop compRow03
        ;escribir cont,1

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret
; ********************* verifica las Columnas ****************************
row04:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+0]
        mov dh, 1
        cmp dl, 1
        jz incContCol
        endcompRow04Fil01:

        mov dl, [fila2+0]
        mov dh, 2
        cmp dl, 1
        jz incContCol
        endcompRow04Fil02:

        mov dl, [fila3+0]
        mov dh, 3
        cmp dl, 1
        jz incContCol
        endcompRow04Fil03:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret

row05:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+1]
        mov dh, 4
        cmp dl, 1
        jz incContCol
        endcompRow05Fil01:

        mov dl, [fila2+1]
        mov dh, 5
        cmp dl, 1
        jz incContCol
        endcompRow05Fil02:

        mov dl, [fila3+1]
        mov dh, 6
        cmp dl, 1
        jz incContCol
        endcompRow05Fil03:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret

row06:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+2]
        mov dh, 7
        cmp dl, 1
        jz incContCol
        endcompRow06Fil01:

        mov dl, [fila2+2]
        mov dh, 8
        cmp dl, 1
        jz incContCol
        endcompRow06Fil02:

        mov dl, [fila3+2]
        mov dh, 9
        cmp dl, 1
        jz incContCol
        endcompRow06Fil03:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret

; ********************* verifica las diagonales **************************

; *********************** incrementa el contador para ROW, COL, DIAGONAL*************************
incContRow:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    cmp dh, 1
        jz endcompRow01
    cmp dh, 2
        jz endcompRow02
    cmp dh, 3
        jz endcompRow03

incContCol:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    cmp dh, 1
        jz endcompRow04Fil01
    cmp dh, 2
        jz endcompRow04Fil02
    cmp dh, 3
        jz endcompRow04Fil03
    cmp dh, 4
        jz endcompRow05Fil01
    cmp dh, 5
        jz endcompRow05Fil02
    cmp dh, 6
        jz endcompRow05Fil03
    cmp dh, 7
        jz endcompRow06Fil01
    cmp dh, 8
        jz endcompRow06Fil02
    cmp dh, 9
        jz endcompRow06Fil03

; ======================================== IMPRIMIR MENSAJE GANADOR ===================================
; =====================================================================================================
winJ1:
    escribir msjWinJ1, lenmsjWinJ1
    jmp impMatriz

winJ2:
    escribir msjWinJ2, lenmsjWinJ2
    jmp impMatriz

; ========================================= Imprimir TABLERO SIN INTERFAZ ============================================
; ====================================================================================================================

impMatriz:
    mov ecx,0
    impF1:
        push ecx
        mov al, [fila1 + ecx]
        add al, '0'
        mov [resultado], al
        escribir resultado, 2
        pop ecx
        inc ecx
        cmp ecx, lenfila1
        jb impF1
        escribir salto,1
        mov ecx, 0
        ;jmp salir

    impF2:
        push ecx
        mov al, [fila2 + ecx]
        add al, '0'
        mov [resultado], al
        escribir resultado, 2
        pop ecx
        inc ecx
        cmp ecx, lenfila2
        jb impF2
        escribir salto,1
        mov ecx, 0
        ;jmp salir

    impF3:
        push ecx
        mov al, [fila3 + ecx]
        add al, '0'
        mov [resultado], al
        escribir resultado, 2
        pop ecx
        inc ecx
        cmp ecx, lenfila3
        jb impF3
        escribir salto,1
        jmp salir

; ============================================== SALIR =====================================================
; ==========================================================================================================
salir:
    escribir msjEnd, lenEnd
    mov eax, 1
    mov ebx, 0
    int 80H
