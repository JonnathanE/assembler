section .data
    mensaje TIMES 7 db '*'
    len EQU $-mensaje
    
section .text
    global _start

_start:
    mov eax,04
    mov ebx,01
    mov ecx,mensaje
    mov edx,len
    int 80H
    
    mov eax,1
    mov ebx,0
    int 80H
    
    ;nasm -f elf time.asm 
    ;ld -m elf_i386 -s -o time time.o
    ;chmod +x time
    ;./time