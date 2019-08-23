; Este es el juego de la vibora que corre por toda la pantalla y esta armado en asm win16 


; este es el juego de serpientes comiendo pantalla ... 
; 
; este juego lleva al emulador a sus límites 
; e incluso con la velocidad máxima, sigue funcionando lentamente. 
; para disfrutar de este juego, se recomienda ejecutarlo de verdad 
; computadora, sin embargo, el emulador puede ser útil para depurar 
; juegos pequeños y otros programas similares como este antes 
; se vuelven libres de errores y viables. 
; 
; puedes controlar la serpiente usando las teclas de flecha en tu teclado. 
; 
; todas las demás llaves detendrán a la serpiente. 
; 
; presione esc para salir. 

nombre "serpiente" 

org 100h 

; saltar sobre la sección de datos: 
jmp start 

; ------ sección de datos ------ 

s_size equ 7 

; las coordenadas de la serpiente 
; (de la cabeza a la cola) 
; se deja el byte bajo, byte alto 
; is top - [arriba, izquierda] 
serpiente dw s_size dup (0) 

tail dw? 

; constantes de dirección 
; (códigos de clave de BIOS): 
izquierda equ 4bh 
derecha equ 4dh 
arriba equ 48h 
abajo equ 50h 

; dirección actual de la serpiente: 
cur_dir db right 

wait_time dw 0 

; mensaje de bienvenida 
msg db "==== cómo jugar ====", 0dh, 0ah 
db "este juego fue depurado en emu8086", 0dh, 0ah 
db "pero no está diseñado para ejecutarse en el emulador", 0dh, 0ah 
db "porque requiere una tarjeta de video y una CPU relativamente rápidas", 0dh, 0ah, 0ah 

db "si quieres ver cómo funciona realmente este juego", 0dh, 0ah 
db " ejecútalo en una computadora real ( haz clic en externo-> ejecutar desde el menú). ", 0dh, 0ah, 0ah 

db" puede controlar la serpiente con las teclas de flecha ", 0dh, 0ah	
db" todas las demás teclas detendrán la serpiente ", 0dh, 0ah, 0ah 

db" presione esc para salir. ", 0dh, 0ah 
db" ==================== ", 0dh, 0ah, 0ah 
db" presione cualquier tecla para comenzar ... $ " 

; ------ ------ sección de código de 

comenzar: 

; imprimir mensaje de bienvenida: 
mov dx, offset msg 
mov ah, 9 
int 21h 

; espera cualquier tecla: 
mov ah, 
00h int 16h 

; ocultar cursor de texto: 
mov ah, 1 
ch mov, 2BH 
cl mov, 0BH 
int 10h 

game_loop: 

; === seleccionar primera página de video 
mov al, 0; número de página. 
mov ah, 05h 
int 10h 

; === mostrar nueva cabeza: 
mov dx, serpiente [0] 

; coloque el cursor en dl, dh 
mov ah, 02h 
int 10h 

; imprima '*' en la ubicación: 
mov al, '*' 
mov ah, 09h 
mov bl, 0eh; atributo. 
mov cx, 1; solo char. 
int 10h 

; === mantener la cola: 
mov axe, snake [s_size * 2 - 2] 
mov tail, axe 

call move_snake 

; === ocultar cola vieja: 
mov dx, cola 

; coloque el cursor en dl, dh 
mov ah, 02h 
int 10h 

; print '' en la ubicación: 
mov al, '' 
mov ah, 09h 
mov bl, 0eh; atributo. 
mov cx, 1; solo char. 
int 10h 


check_for_key: 

; === comprobar los comandos del jugador: 
mov ah, 01h 
int 16h 
jz no_key 

mov ah, 00h 
int 16h 

cmp al, 1bh; clave esc? 
je stop_game; 

mov cur_dir, ah 

no_key: 


; === espera unos momentos aquí 
:; obtener el número de tics de reloj 
; (aproximadamente 18 por segundo) 
; desde la medianoche hasta cx: dx 
mov ah, 00h 
int 1ah 
cmp dx, wait_time 
jb check_for_key 
add dx, 4 
mov wait_time, dx 


; === bucle eterno juego: 
JMP game_loop 

stop_game: 

; mostrar el cursor hacia atrás: 
mov ah, 1 
mov ch, 0bh 
mov cl, 0bh 
int 10h 

ret 

; ------ sección de funciones ------ 

; este procedimiento crea el 
; animación moviendo toda serpiente 
; partes del cuerpo un paso a la cola 
; la vieja cola se va 
; [última parte (cola)] -> desaparece 
; [parte i] -> [parte i + 1] 
; .... 

move_snake proc cerca 

; establece el segmento de información es bios: 
mov ax, 40h 
mov es, ax 

; apunte di a tail 
mov di, s_size * 2 - 2 
; mover todas las partes del cuerpo 
; (el último simplemente desaparece) 
mov cx, s_size-1 
move_array: 
mov ax, snake [di-2] 
mov snake [di], axe 
di, 2 
loop move_array 

cmp cur_dir, left 
je move_left 
cmp cur_dir, right 
je move_right 
cmp cur_dir, arriba 
je move_up 
cmp cur_dir, abajo 
je move_down 

jmp stop_move; sin dirección. 

move_left: 
mov al, b.snake [0] 
dec al 
mov b.snake [0], al 
cmp al, -1 
jne stop_move 
mov al, es: [4ah]; número de col. 
dec al 
mov b.snake [0], al; volver a la derecha 
jmp stop_move 

move_right: 
mov al, b.snake [0] 
inc al 
mov b.snake [0], al 
cmp al, es: [4ah]; número de col. 
jb stop_move 
mov b.snake [0], 0; volver a la izquierda 
jmp stop_move 

move_up: 
mov al, b.snake [1] 
dec al 
mov b.snake [1], al 
cmp al, -1 
jne stop_move 
mov al, es: [84h]; fila número -1. 
mov b.snake [1], al; volver al fondo 
jmp stop_move 

move_down: 
mov al, b.snake [1] 
inc al 
mov b.snake [1], al 
cmp al, es: [84h]; fila número -1. 
jbe stop_move 
mov b.snake [1], 0; volver a la cima. 
jmp stop_move 

stop_move: 
ret 
move_snake endp