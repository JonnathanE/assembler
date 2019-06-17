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

**Division 8 bits**
```
Ax = AH residuo, Al cociente
div bl -> ax = al/bl
```

**Saltos no condicionales**
    *   jmp operando
        *   jmp 103
            *   jmp etiquetas
    
    je,jp,jc,jz -> la bandera se activa
    jne,jnc,nnp -> la bandera no se activa
            

**Compert cmp**

cmp operando1, operando2

op1 = op2 -> ZR
op1 != op2 -> NZ

```
cmp(3,3)
    ZF = 1  CF = 0
cmp(4,3)
    ZF = 0  CF = 0
cmp(3,4)
    ZF = 0  CF = 1
```

DEBER

Menu
    1 Suma
    2 Res
    3 Mul
    4 Div
    5 Salir
    

**And**

Si ambos bits coinciden = 1
si ambos bits no coinciden = 0
```
mov al, 7
and al, 1
jz par
```

**Pila**

Se gurda el valor en la pila, no se gurda la referencia
```
ingresar nombre
mov ax, [nombre]
push ax
pop bx
```

**DEBER**

Pedir un numero: 5

presentar una matriz [n][n] con asteristos
```
*****
*****
*****
*****
*****
```