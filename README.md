# Assembler
Es un proyecto en donde se encuentran ejemplos de lenguaje ensamblador

Se utiliza **nasm** en Linux

`sudo apt-get install nasm`

## Comandos para Crear el ejecutable

1.  Compilacion
```
nasm -f elf nombre.asm
nasm -f elf64 nombre.asm    
```
2.  linke
```
ld -m elf_i386 -s -o nombre archivo.o
```
3.  Dar permisos y ejecutar
```
sudo chmod +x archivo.sh
./nombre
```
##  Usar ejecutable.sh
Se puede crear un script para ejecutar el programa de forma sencilla. El codigo se encientra en el archivo *ejecutar.sh*

Para ejecutar se debe escribir la siguiente linea en la terminal de linux:

`./ejecutar.sh nombreArchivo`
/usr/include/asm-generic/
unistd.h

##  DIrectivas
**dword**
Cambiar el valor original de una constante
desplazamientos a nivel de memoria
byte 1b
word 2b
dword 4b
qword 8b
tword 10b
```
mensaje db 'Hola'
[mensaje] ;-> para acceder a memoria
mov [mensaje + 0], dword 'mala' ;-> estoy accediendo un desplazamiento dentro del valor en donde esta almacenado el mensaje
```
constatnes
    *   equ
    *   assign
    *   define

**EQU**
definir tamano del componenete
no se puede modificar
``
len EQU $-mensaje
``

**assign**
```
msj db "valor"
letra equ 'a'
; %assign
; %assign identificador valor
%assign signos '***'
```
**define**
`; %define identificador valor`
`%define signos '***'`