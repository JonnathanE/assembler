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

|Constante|Variable|
|:--:|:--:|
|d   |res |

constante|tamano|variable
:---:|------ |:---:|
db   |byte             |resb
dw   |word             |resw
dd   |double word      |resd
dq   |palabra cuadruple|resq
dt   |parrafo/texto    |rest

**dword**

Cambiar el valor original de una constante
desplazamientos a nivel de memoria

byte 1b

word 2b

dword 4b

qword 8b

tword 16b
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
    ZF = 1  CF = 0      jz
cmp(4,3)
    ZF = 0  CF = 0      jg
cmp(3,4)
    ZF = 0  CF = 1      jb,jc
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

```
    mov ax, [a]
    sub ax,'0' ;convertir cadena a numero
    add ax, 1
    JP par
    JNP impar
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

**call**

subrutina c -> api

Nota: si no retorna con la etiqurta `ret`, el programa se traba

```
l1:
    push ecx
    push ebx
    call imprimir_enter
    pop ecx
    mov ebx, ecx
    push ebx
```

**ret**

Retorna a la ultima linea del llamado

```
imprimir_enter:
    mov eax, 4
    mov ebx, 1
    mov ecx, nueva_linea
    mov edx, 1
    int 80H
    ret ; retorna a la ultima linea del llamado
```

**loop**

instruccion de ciclos

decrementa cx



```
l2:
    push ecx
    call imprimir_asterisco
    pop ecx
    loop l2 ; ecx != 0
    pop ebx
    pop ecx
    inc ebx
    loop l1
    jmp salir
```

## Programación en lenguaje ensamblador/Primeros conceptos

https://es.wikibooks.org/wiki/Programaci%C3%B3n_en_lenguaje_ensamblador/Primeros_conceptos#Saltos_incondicionales_y_condicionales

**pushF y popF**

guarda y restablece la pila y el estado de las banderas

**pusha y popa (20286)**

Guarda y restablece el contenido de RPG ax, bx, cx, dex


**Saltos**

mismo segmento:

*   cortos      1 bytes -128 a 127 bytes
*   cercanos    2 bytes 32768 a 32767

(css: ip ) Salto de segmento:

*   call
*   jmp

|   Banderas    |   Cortas  |   Cercanos    |   Lejanos |
|   :--:        |   :--:    |   :--:        |   :--:    |
|               | -128 a 127 bytes  | -32768 a 32767 bytes  |
|               |   mismo segment0  |   mismo segmento      |   mismo segmento  |
|   jmp         |   si              |       si              |   si              |
|   jnn         |   si              |  >80383 familia procesadores |    no      |
|   loop        |   si              |       no              |   no              |
|   call        |   si/no           |       si              |   si              |


inst. Saltos incondicionales
jb = jc
transfiere el control dependiendo de la configuracion de la bandera

si jnn sobrepasa los bytes es un error de segmentacion

**Instrucciones que modifican las banderas**
*   and
*   add

**Se modifican**
*   ip saltos cercanos
*   cs and ip en saltos lejanos

**DEBER**
135 libro de petter
8.4, 8.13, 8.14, 8.15


https://es.wikipedia.org/wiki/Int_80h

Operaciones de suma simple

``mov eax, 5
add eax, '0'    ; cero  en codigo ascii es 48
add eax, 48
escribir eax, 1
``
