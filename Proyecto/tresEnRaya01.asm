%macro escribir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
    msjStar db 0x1b,"[4;30f", 0x1b,"[33m", "Presione enter para comenzar"
    lenStar EQU $-msjStar

    msjEnd db "END",10
    lenEnd EQU $-msjEnd

    msjWinJ1 db 0x1b,"[93m","Jugador 1 WINS!!",10, 0x1b,"[37m"
    lenmsjWinJ1 EQU $-msjWinJ1

    msjWinJ2 db 0x1b,"[93m","Jugador 2 WINS!!",10, 0x1b,"[37m"
    lenmsjWinJ2 EQU $-msjWinJ2

    msjEmpates db "Empates",10
    lenmsjEmpates EQU $-msjEmpates

    salto db 10,' '

    msjFila db "Fila: "
    lenFila EQU $-msjFila

    msjCol db "Columna: "
    lenCol EQU $-msjCol

    msjJ1 db 0x1b,"[5;0f", 0x1b,"[96m","Jugador 1",10, 0x1b,"[37m"
    lenJ1 EQU $-msjJ1

    msjJ2 db 0x1b,"[5;0f", 0x1b,"[32m","Jugador 2",10, 0x1b,"[37m"
    lenJ2 EQU $-msjJ2

    ; declaracion de filas
    fila1 db 0, 0, 0
    lenfila1 EQU $-fila1

    fila2 db 0, 0, 0
    lenfila2 EQU $-fila2

    fila3 db 0, 0, 0
    lenfila3 EQU $-fila3

    ; dibujar CIR: row 1; col 2
    CC08 db 0x1b,"[14;36f", 0x1b,"[32m",'===='
    lenCC08 EQU $-CC08
    ; dibujar CIR: row 1; col 3
    CC09 db 0x1b,"[14;48f", 0x1b,"[32m",'===='
    ; dibujar CIR: row 2; col 1
    CC10 db 0x1b,"[20;24f", 0x1b,"[32m",'===='
    ;cc1 db 0x1b,"[20;36f",0x1b,"[37m",'==='
    ;lencc1 EQU $-cc1

    ; dibujar X: row 1; col 1
    xC01 db 0x1b,"[12;24f", 0x1b,"[96m",'\   /'
    lenxC01 EQU $-xC01
    xC02 db 0x1b,"[13;24f", 0x1b,"[96m",' \ /'
    lenxC02 EQU $-xC02
    xC03 db 0x1b,"[14;24f", 0x1b,"[96m",'  \'
    lenxC03 EQU $-xC03
    xC04 db 0x1b,"[15;24f", 0x1b,"[96m",' / \'
    lenxC04 EQU $-xC04
    xC05 db 0x1b,"[16;24f", 0x1b,"[96m",'/   \'
    lenxC05 EQU $-xC05
    ; dibujar X: row 1; col 2
    xC06 db 0x1b,"[12;36f", 0x1b,"[96m",'\   /'
    xC07 db 0x1b,"[13;36f", 0x1b,"[96m",' \ /'
    xC08 db 0x1b,"[14;36f", 0x1b,"[96m",'  \'
    xC09 db 0x1b,"[15;36f", 0x1b,"[96m",' / \'
    xC10 db 0x1b,"[16;36f", 0x1b,"[96m",'/   \'
    ; dibujar X: row 1; col 3
    xC11 db 0x1b,"[12;48f", 0x1b,"[96m",'\   /'
    xC12 db 0x1b,"[13;48f", 0x1b,"[96m",' \ /'
    xC13 db 0x1b,"[14;48f", 0x1b,"[96m",'  \'
    xC14 db 0x1b,"[15;48f", 0x1b,"[96m",' / \'
    xC15 db 0x1b,"[16;48f", 0x1b,"[96m",'/   \'
    ; dibujar X: row 2; col 1
    xC16 db 0x1b,"[18;24f", 0x1b,"[96m",'\   /'
    xC17 db 0x1b,"[19;24f", 0x1b,"[96m",' \ /'
    xC18 db 0x1b,"[20;24f", 0x1b,"[96m",'  \'
    xC19 db 0x1b,"[21;24f", 0x1b,"[96m",' / \'
    xC20 db 0x1b,"[22;24f", 0x1b,"[96m",'/   \'
    ; dibujar X: row 2; col 2
    xC21 db 0x1b,"[18;36f", 0x1b,"[96m",'\   /'
    xC22 db 0x1b,"[19;36f", 0x1b,"[96m",' \ /'
    xC23 db 0x1b,"[20;36f", 0x1b,"[96m",'  \'
    xC24 db 0x1b,"[21;36f", 0x1b,"[96m",' / \'
    xC25 db 0x1b,"[22;36f", 0x1b,"[96m",'/   \'
    ; dibujar X: row 2; col 3
    xC26 db 0x1b,"[18;48f", 0x1b,"[96m",'\   /'
    xC27 db 0x1b,"[19;48f", 0x1b,"[96m",' \ /'
    xC28 db 0x1b,"[20;48f", 0x1b,"[96m",'  \'
    xC29 db 0x1b,"[21;48f", 0x1b,"[96m",' / \'
    xC30 db 0x1b,"[22;48f", 0x1b,"[96m",'/   \'
    ; dibujar X: row 3; col 1
    xC31 db 0x1b,"[24;24f", 0x1b,"[96m",'\   /'
    xC32 db 0x1b,"[25;24f", 0x1b,"[96m",' \ /'
    xC33 db 0x1b,"[26;24f", 0x1b,"[96m",'  \'
    xC34 db 0x1b,"[27;24f", 0x1b,"[96m",' / \'
    xC35 db 0x1b,"[28;24f", 0x1b,"[96m",'/   \'
    ; dibujar X: row 3; col 2
    xC36 db 0x1b,"[24;36f", 0x1b,"[96m",'\   /'
    xC37 db 0x1b,"[25;36f", 0x1b,"[96m",' \ /'
    xC38 db 0x1b,"[26;36f", 0x1b,"[96m",'  \'
    xC39 db 0x1b,"[27;36f", 0x1b,"[96m",' / \'
    xC40 db 0x1b,"[28;36f", 0x1b,"[96m",'/   \'
    ; dibujar X: row 3; col 3
    xC41 db 0x1b,"[24;48f", 0x1b,"[96m",'\   /'
    xC42 db 0x1b,"[25;48f", 0x1b,"[96m",' \ /'
    xC43 db 0x1b,"[26;48f", 0x1b,"[96m",'  \'
    xC44 db 0x1b,"[27;48f", 0x1b,"[96m",' / \'
    xC45 db 0x1b,"[28;48f", 0x1b,"[96m",'/   \'
    ; dibujar CIR: row 1; col 1
    CC01 db 0x1b,"[12;24f", 0x1b,"[32m",' --- '
    lenCC01 EQU $-CC01
    CC02 db 0x1b,"[13;24f", 0x1b,"[32m",'/   \'
    lenCC02 EQU $-CC02
    CC03 db 0x1b,"[14;24f", 0x1b,"[32m",'|   |'
    lenCC03 EQU $-CC03
    CC04 db 0x1b,"[15;24f", 0x1b,"[32m",'\   /'
    lenCC04 EQU $-CC04
    CC05 db 0x1b,"[16;24f", 0x1b,"[32m",' --- '
    lenCC05 EQU $-CC05

    ; dibujar
    lineH01 db 0x1b,"[11;20f", 0x1b,"[37m",'-------------------------------------'
    lineH02 db 0x1b,"[17;20f", 0x1b,"[37m",'-------------------------------------'
    lineH03 db 0x1b,"[23;20f", 0x1b,"[37m",'-------------------------------------'
    lineH04 db 0x1b,"[29;20f", 0x1b,"[37m",'-------------------------------------'
    lenlineH01 EQU $-lineH01

    lineC01 db 0x1b,"[12;20f", 0x1b,"[37m",'|           |           |           |'
    lineC02 db 0x1b,"[13;20f", 0x1b,"[37m",'|           |           |           |'
    lineC03 db 0x1b,"[14;20f", 0x1b,"[37m",'|           |           |           |'
    lineC04 db 0x1b,"[15;20f", 0x1b,"[37m",'|           |           |           |'
    lineC05 db 0x1b,"[16;20f", 0x1b,"[37m",'|           |           |           |'

    lineC06 db 0x1b,"[18;20f", 0x1b,"[37m",'|           |           |           |'
    lineC07 db 0x1b,"[19;20f", 0x1b,"[37m",'|           |           |           |'
    lineC08 db 0x1b,"[20;20f", 0x1b,"[37m",'|           |           |           |'
    lineC09 db 0x1b,"[21;20f", 0x1b,"[37m",'|           |           |           |'
    lineC10 db 0x1b,"[22;20f", 0x1b,"[37m",'|           |           |           |'

    lineC11 db 0x1b,"[24;20f", 0x1b,"[37m",'|           |           |           |'
    lineC12 db 0x1b,"[25;20f", 0x1b,"[37m",'|           |           |           |'
    lineC13 db 0x1b,"[26;20f", 0x1b,"[37m",'|           |           |           |'
    lineC14 db 0x1b,"[27;20f", 0x1b,"[37m",'|           |           |           |'
    lineC15 db 0x1b,"[28;20f", 0x1b,"[37m",'|           |           |           |'





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
    ; ==========================================================================================================
    ; ==================================== llenar las filas con un valor 5 =====================================
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

    ; =====================================================================================================
    ; ===================================== Iniciar el juego ==============================================
    ; =====================================================================================================

    escribir msjStar, lenStar
    mov eax, 3
    mov ebx, 2
    mov ecx, inicio
    mov edx, 1
    int 80H

    call drawTable
    ;call drawXR1C3
    ;call drawCR2C1


    ; ====================================================================================================
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
    jmp IngresarNum



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
    jmp IngresarNum

col0F1:                                 ; ingresa col 0 row 1
    mov ah, 1
    mov [fila1+0], ah
    mov ecx, 0
    call drawIcon
    call siEstaLlena
    call row01
    call row04
    call row08
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
    call row07
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
    jmp IngresarNum

col0F2:                                 ; ingresa col 0 row 2
    mov ah, 1
    mov [fila2+0], ah
    mov ecx, 0
    call siEstaLlena
    call row02
    call row04
    jmp IngresarNumJ2
col1F2:                                 ; ingresa col 1 row 2
    mov ah, 1
    mov [fila2+1], ah
    mov ecx, 0
    call siEstaLlena
    call row02
    call row05
    call row07
    call row08
    jmp IngresarNumJ2
col2F2:                                 ; ingresa col 2 row 2
    mov ah, 1
    mov [fila2+2], ah
    mov ecx, 0
    call siEstaLlena
    call row02
    call row06
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
    jmp IngresarNum

col0F3:                                 ; ingresa col 0 row 3
    mov ah, 1
    mov [fila3+0], ah
    mov ecx, 0
    call siEstaLlena
    call row03
    call row04
    call row07
    jmp IngresarNumJ2
col1F3:                                 ; ingresa col 2 row 3
    mov ah, 1
    mov [fila3+1], ah
    mov ecx, 0
    call siEstaLlena
    call row03
    call row05
    jmp IngresarNumJ2
col2F3:                                 ; ingresa col 3 row 3
    mov ah, 1
    mov [fila3+2], ah
    mov ecx, 0
    call siEstaLlena
    call row03
    call row06
    call row08
    jmp IngresarNumJ2

    ; ========================================================================================================================
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
    jmp IngresarNumJ2

col0F1J2:                                 ; ingresa col 0 row 1
    mov ah, 0
    mov [fila1+0], ah
    mov ecx, 0
    call siEstaLlena
    call row01J2
    call row04J2
    call row08J2
    jmp IngresarNum
col1F1J2:                                 ; ingresa col 1 row 1
    mov ah, 0
    mov [fila1+1], ah
    mov ecx, 0
    call siEstaLlena
    call row01J2
    call row05J2
    jmp IngresarNum
col2F1J2:                                 ; ingresa col 2 row 1
    mov ah, 0
    mov [fila1+2], ah
    mov ecx, 0
    call siEstaLlena
    call row01J2
    call row06J2
    call row07J2
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
    jmp IngresarNumJ2

col0F2J2:                                 ; ingresa col 0 row 2
    mov ah, 0
    mov [fila2+0], ah
    mov ecx, 0
    call siEstaLlena
    call row02J2
    call row04J2
    jmp IngresarNum
col1F2J2:                                 ; ingresa col 1 row 2
    mov ah, 0
    mov [fila2+1], ah
    mov ecx, 0
    call siEstaLlena
    call row02J2
    call row05J2
    call row07J2
    call row08J2
    jmp IngresarNum
col2F2J2:                                 ; ingresa col 2 row 2
    mov ah, 0
    mov [fila2+2], ah
    mov ecx, 0
    call siEstaLlena
    call row02J2
    call row06J2
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
    jmp IngresarNumJ2

col0F3J2:                                 ; ingresa col 0 row 3
    mov ah, 0
    mov [fila3+0], ah
    mov ecx, 0
    call siEstaLlena
    call row03J2
    call row04J2
    call row07J2
    jmp IngresarNum
col1F3J2:                                 ; ingresa col 2 row 3
    mov ah, 0
    mov [fila3+1], ah
    mov ecx, 0
    call siEstaLlena
    call row03J2
    call row05J2
    jmp IngresarNum
col2F3J2:                                 ; ingresa col 3 row 3
    mov ah, 0
    mov [fila3+2], ah
    mov ecx, 0
    call siEstaLlena
    call row03J2
    call row06J2
    call row08J2
    jmp IngresarNum

; ===================================================================================================================
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
        inc esi
        cmp dl, 5
        jz incCont1
        endl1:
        loop CompF1

        mov ecx, 3
        mov esi, 0

    CompF2:
        mov dl, [fila2+esi]
        inc esi
        cmp dl, 5
        jz incCont2
        endl2:
        loop CompF2

        mov ecx, 3
        mov esi, 0

    CompF3:
        mov dl, [fila3+esi]
        inc esi
        cmp dl, 5
        jz incCont3
        endl3:
        loop CompF3

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 0
            jz empates
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

; ==============================================================================================
; ==================================== JUGADOR 1 ===============================================
; ==============================================================================================
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
row07: ; diagonal secundaria
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+2]
        mov dh, 1
        cmp dl, 1
        jz incContDiag
        endcompRow07Fil01:

        mov dl, [fila2+1]
        mov dh, 2
        cmp dl, 1
        jz incContDiag
        endcompRow07Fil02:

        mov dl, [fila3+0]
        mov dh, 3
        cmp dl, 1
        jz incContDiag
        endcompRow07Fil03:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret

row08: ; diagonal principal
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+0]
        mov dh, 4
        cmp dl, 1
        jz incContDiag
        endcompRow08Fil01:

        mov dl, [fila2+1]
        mov dh, 5
        cmp dl, 1
        jz incContDiag
        endcompRow08Fil02:

        mov dl, [fila3+2]
        mov dh, 6
        cmp dl, 1
        jz incContDiag
        endcompRow08Fil03:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ1
        ret

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

incContDiag:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    cmp dh, 1
        jz endcompRow07Fil01
    cmp dh, 2
        jz endcompRow07Fil02
    cmp dh, 3
        jz endcompRow07Fil03
    cmp dh, 4
        jz endcompRow08Fil01
    cmp dh, 5
        jz endcompRow08Fil02
    cmp dh, 6
        jz endcompRow08Fil03





; ==============================================================================================
; ==================================== JUGADOR 2 ===============================================
; ==============================================================================================
; ===================================== VERIFICAR TRES EN RAYA =================================
; ==============================================================================================

; ********************* verifica las filas *************************
row01J2:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov ecx, 3                          ; inicio contador del bulce
        mov esi, 0                          ; inicio apuntador

    compRow01J2:
        mov dl, [fila1+esi]
        inc esi
        mov dh, 1
        cmp dl, 0
            jz incContRowJ2
        endcompRow01J2:
        loop compRow01J2

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret

row02J2:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov ecx, 3
        mov esi, 0

    compRow02J2:
        mov dl, [fila2+esi]
        inc esi
        mov dh, 2
        cmp dl, 0
            jz incContRowJ2
        endcompRow02J2:
        loop compRow02J2

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret

row03J2:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov ecx, 3
        mov esi, 0

    compRow03J2:
        mov dl, [fila3+esi]
        inc esi
        mov dh, 3
        cmp dl, 0
            jz incContRowJ2
        endcompRow03J2:
        loop compRow03J2

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret
; ********************* verifica las Columnas ****************************
row04J2:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+0]
        mov dh, 1
        cmp dl, 0
        jz incContColJ2
        endcompRow04Fil01J2:

        mov dl, [fila2+0]
        mov dh, 2
        cmp dl, 0
        jz incContColJ2
        endcompRow04Fil02J2:

        mov dl, [fila3+0]
        mov dh, 3
        cmp dl, 0
        jz incContColJ2
        endcompRow04Fil03J2:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret

row05J2:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+1]
        mov dh, 4
        cmp dl, 0
        jz incContColJ2
        endcompRow05Fil01J2:

        mov dl, [fila2+1]
        mov dh, 5
        cmp dl, 0
        jz incContColJ2
        endcompRow05Fil02J2:

        mov dl, [fila3+1]
        mov dh, 6
        cmp dl, 0
        jz incContColJ2
        endcompRow05Fil03J2:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret

row06J2:
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+2]
        mov dh, 7
        cmp dl, 0
        jz incContColJ2
        endcompRow06Fil01J2:

        mov dl, [fila2+2]
        mov dh, 8
        cmp dl, 0
        jz incContColJ2
        endcompRow06Fil02J2:

        mov dl, [fila3+2]
        mov dh, 9
        cmp dl, 0
        jz incContColJ2
        endcompRow06Fil03J2:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret

; ********************* verifica las diagonales **************************
row07J2: ; diagonal secundaria
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+2]
        mov dh, 1
        cmp dl, 0
        jz incContDiagJ2
        endcompRow07Fil01J2:

        mov dl, [fila2+1]
        mov dh, 2
        cmp dl, 0
        jz incContDiagJ2
        endcompRow07Fil02J2:

        mov dl, [fila3+0]
        mov dh, 3
        cmp dl, 0
        jz incContDiagJ2
        endcompRow07Fil03J2:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret

row08J2: ; diagonal principal
        mov ah, 0
        add ah, '0'
        mov [cont],ah                       ; inicio mi contador en cero

        mov dl, [fila1+0]
        mov dh, 4
        cmp dl, 0
        jz incContDiagJ2
        endcompRow08Fil01J2:

        mov dl, [fila2+1]
        mov dh, 5
        cmp dl, 0
        jz incContDiagJ2
        endcompRow08Fil02J2:

        mov dl, [fila3+2]
        mov dh, 6
        cmp dl, 0
        jz incContDiagJ2
        endcompRow08Fil03J2:

        mov bl, [cont]
        sub bl, '0'
        cmp bl, 3
            jz winJ2
        ret

; *********************** incrementa el contador para ROW, COL, DIAGONAL*************************
incContRowJ2:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    cmp dh, 1
        jz endcompRow01J2
    cmp dh, 2
        jz endcompRow02J2
    cmp dh, 3
        jz endcompRow03J2

incContColJ2:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    cmp dh, 1
        jz endcompRow04Fil01J2
    cmp dh, 2
        jz endcompRow04Fil02J2
    cmp dh, 3
        jz endcompRow04Fil03J2
    cmp dh, 4
        jz endcompRow05Fil01J2
    cmp dh, 5
        jz endcompRow05Fil02J2
    cmp dh, 6
        jz endcompRow05Fil03J2
    cmp dh, 7
        jz endcompRow06Fil01J2
    cmp dh, 8
        jz endcompRow06Fil02J2
    cmp dh, 9
        jz endcompRow06Fil03J2

incContDiagJ2:
    mov bl, [cont]
    sub bl, '0'
    inc bl
    add bl, '0'
    mov [cont], bl
    cmp dh, 1
        jz endcompRow07Fil01J2
    cmp dh, 2
        jz endcompRow07Fil02J2
    cmp dh, 3
        jz endcompRow07Fil03J2
    cmp dh, 4
        jz endcompRow08Fil01J2
    cmp dh, 5
        jz endcompRow08Fil02J2
    cmp dh, 6
        jz endcompRow08Fil03J2


; ====================================================================================================
drawIcon:
    mov al, [fila1+0]
    cmp al, 1
    call drawXR1C1
    ;mov al, [fila1+1]
    ;cmp al, 1
    ;call drawXR1C2
    ;mov al, [fila1+2]
    ;cmp al, 1
    ;call drawXR1C3
    ret


; =====================================================================================================
; ======================================== IMPRIMIR MENSAJE GANADOR ===================================
; =====================================================================================================
winJ1:
    escribir msjWinJ1, lenmsjWinJ1
    jmp impMatriz

winJ2:
    escribir msjWinJ2, lenmsjWinJ2
    jmp impMatriz

empates:
    escribir msjEmpates, lenmsjEmpates
    jmp impMatriz

; ====================================================================================================================
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



; ==========================================================================================================
; ============================================== DIBUJAR ===================================================
; ==========================================================================================================
drawTable:
    escribir lineH01, lineH01
    escribir lineH02, lineH01
    escribir lineH03, lineH01
    escribir lineH04, lineH01
    escribir lineC01,1
    escribir lineC02,1
    escribir lineC03,1
    escribir lineC04,1
    escribir lineC05,1
    escribir lineC06,1
    escribir lineC07,1
    escribir lineC08,1
    escribir lineC09,1
    escribir lineC10,1
    escribir lineC11,1
    escribir lineC12,1
    escribir lineC13,1
    escribir lineC14,1
    escribir lineC15,1
    ret

drawXR1C1:
    ; dibujar X: row 1; col 1
    escribir xC01, lenxC01
    escribir xC02, lenxC02
    escribir xC03, lenxC03
    escribir xC04, lenxC04
    escribir xC05, lenxC05
    ret
drawXR1C2:
    ; dibujar X: row 1; col 2
    escribir xC06, lenxC01
    escribir xC07, lenxC02
    escribir xC08, lenxC03
    escribir xC09, lenxC04
    escribir xC10, lenxC05
    ret
drawXR1C3:
    ; dibujar X: row 1; col 3
    escribir xC11, lenxC01
    escribir xC12, lenxC02
    escribir xC13, lenxC03
    escribir xC14, lenxC04
    escribir xC15, lenxC05
    ret
drawXR2C1:
    ; dibujar X: row 2; col 1
    escribir xC16, lenxC01
    escribir xC17, lenxC02
    escribir xC18, lenxC03
    escribir xC19, lenxC04
    escribir xC20, lenxC05
    ret
drawXR2C2:
    ; dibujar X: row 2; col 2
    escribir xC21, lenxC01
    escribir xC22, lenxC02
    escribir xC23, lenxC03
    escribir xC24, lenxC04
    escribir xC25, lenxC05
    ret
drawXR2C3:
    ; dibujar X: row 2; col 3
    escribir xC26, lenxC01
    escribir xC27, lenxC02
    escribir xC28, lenxC03
    escribir xC29, lenxC04
    escribir xC30, lenxC05
    ret
drawXR3C1:
    ; dibujar X: row 3; col 1
    escribir xC31, lenxC01
    escribir xC32, lenxC02
    escribir xC33, lenxC03
    escribir xC34, lenxC04
    escribir xC35, lenxC05
    ret
drawXR3C2:
    ; dibujar X: row 3; col 2
    escribir xC36, lenxC01
    escribir xC37, lenxC02
    escribir xC38, lenxC03
    escribir xC39, lenxC04
    escribir xC40, lenxC05
    ret
drawXR3C3:
    ; dibujar X: row 3; col 3
    escribir xC41, lenxC01
    escribir xC42, lenxC02
    escribir xC43, lenxC03
    escribir xC44, lenxC04
    escribir xC45, lenxC05
    ret
drawCR1C1:
    ; dibujar CIR: row 1; col 1
    escribir CC01, lenCC01
    escribir CC02, lenCC02
    escribir CC03, lenCC03
    escribir CC04, lenCC04
    escribir CC05, lenCC05
    ret
drawCR1C2:
    ; dibujar CIR: row 1; col 1
    escribir CC08, lenCC08
    ret
drawCR1C3:
    ; dibujar CIR: row 1; col 3
    escribir CC09, lenCC08
    ret
drawCR2C1:
    ; dibujar CIR: row 2; col 1
    escribir CC10, lenCC08
    ret
;drawCR2C2:
    ; dibujar CIR: row 2; col 2
 ;   escribir cc1, lencc1
  ;  ret


; ==========================================================================================================
; ============================================== SALIR =====================================================
; ==========================================================================================================
salir:
    escribir msjEnd, lenEnd
    mov eax, 1
    mov ebx, 0
    int 80H
