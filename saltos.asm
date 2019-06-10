section .data
    msja db "Ingrese el primer valor:"
    lena EQU $-msja
    
    msjb db 10, "Ingrese el segundo valor:"
    lenb EQU $-msjb
    
    mensajito db 10,"Resultado *** :"
    len EQU $-mensajito
    
section .bss
    a resb 1
    b resb 1
    sum resb 1
    restita resb 1
    mult resb 1
    divi resb 1
    residuo resb 1
    
section .text
    global _start
    
_start:
    ;Ingrea el primer valor
    mov eax,4
    mov ebx,1
    mov ecx,msja
    mov edx,lena
    int 80H
    
    mov eax,3
    mov ebx,2
    mov ecx,a
    mov edx,2
    int 80H
    
    ;Ingresa el sugundo valor
    mov eax,4
    mov ebx,1
    mov ecx,msjb
    mov edx,lenb
    int 80H
    
    mov eax,3
    mov ebx,2
    mov ecx,b
    mov edx,2
    int 80H
    
    jmp division

suma:
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    add ax,bx
    add ax,'0'
    mov [sum],ax
    
    mov [mensajito+11], dword 'Sum'
    
    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,mensajito
    mov edx,len
    int 80H
    
    mov eax,4
    mov ebx,1
    mov ecx,sum
    mov edx,1
    int 80H
    
    jmp multiplicacion
    
resta:
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    sub ax,bx
    add ax,'0'
    mov [restita],ax
    
    mov [mensajito+11], dword 'Res'
    
    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,mensajito
    mov edx,len
    int 80H
    
    mov eax,4
    mov ebx,1
    mov ecx,restita
    mov edx,1
    int 80H
    
    jmp suma
    
multiplicacion:
    mov ax, [a]
    mov bx, [b]
    sub ax,'0' ;convertir cadena a numero
    sub bx,'0'
    mul bx
    add ax,'0'
    mov [mult],ax

    mov [mensajito+11], dword 'Mul'
    
    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,mensajito
    mov edx,len
    int 80H
    
    mov eax,4
    mov ebx,1
    mov ecx,mult
    mov edx,1
    int 80H
    
    jmp salir
    
division:
    mov al, [a]
    mov bl, [b]
    sub al,'0' ;convertir cadena a numero
    sub bl,'0'
    div bl
    add ah, '0'
    add al,'0'
    mov [divi],al
    mov [residuo], ah
    
    mov [mensajito+11], dword 'Div'
        
    ;Presentar resultado
    mov eax,4
    mov ebx,1
    mov ecx,mensajito
    mov edx,len
    int 80H
    
    mov eax,4
    mov ebx,1
    mov ecx,divi
    mov edx,1
    int 80H
    
    jmp resta
    
salir:
    mov eax,1
    mov ebx,0
    int 80H