; Estudiante: Venegas Venegas Cristopher Axel

; Imprime MENSAJE con el servicio 09h usando un MACRO
IMPRIME Macro Mensaje 
    mov Ah, 09h
    mov Dx, offset Mensaje
    int 21h
ENDM

LEER Macro Entrada
    mov Ah,0Ah
    mov Dx, offset Entrada
    int 21h
ENDM


CLS Macro
    mov Ah, 0Fh
    int 10h
    mov Ah, 0h
    int 10h
ENDM



.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa
; Tarea: Pedir al usuario un numeor y mostrar su numeros de multiplicar

CLS

IMPRIME Mge1
LEER A
IMPRIME Salto

IMPRIME Mge2
LEER B
IMPRIME Salto

;Suma Bytes 
xor Ax, Ax      ; Ax == 0
mov Ah, A + 2
sub Ah, 30h      ;Ah se resta 30
mov Al, B + 2
sub Al, 30h     ;Al se resta 30
add Ah, Al
add Ah, 30h     ;Ah se resta 30 para convertirlo en el valor real
mov R, Ah

IMPRIME Mge3
IMPRIME R
IMPRIME Salto



;Resta Bytes
xor Ax, Ax      ; Ax == 0
mov Ah, A + 2
add Ah, 30h      ;Ah se suma 30
mov Al, B + 2
add Al, 30h     ;Al se suma 30
sub Ah, Al
add Ah, 30h     ;Ah se suma 30 para convertirlo en el valor real
mov R, Ah

IMPRIME Mge4
IMPRIME R
IMPRIME Salto


;Multiplicacion Bytes
xor Ax, Ax      ; Ax == 0
mov Al, A + 2
sub Al, 30h      ;Al se resta 30

mov Ah, B + 2
sub Ah, 30h     ;Ah se resta 30 

mul Ah      
add Al, 30h     ;Al se anade 30 para convertirlo en el valor real
mov R, Al

IMPRIME Mge5
IMPRIME R
IMPRIME Salto


;Division y Residuo Bytes
xor Ax, Ax

mov Al, A + 2
sub Al, 30h      ;Al se resta 30

mov Ah, B + 2
sub Ah, 30h     ;Bl se resta 30

div Al

add Al, 30h     ;Mostrar division
mov R, Al
IMPRIME Mge6
IMPRIME R
IMPRIME Salto

add Ah, 30h    ;Mostrar residuo
mov R, Ah
IMPRIME Mge7
IMPRIME R
IMPRIME Salto




mov Ax, 4C00h
int 21h


.DATA

Mge1 db "Valor de A: $"
Mge2 db "Valor de B: $"
Mge3 db "La suma es: $"
Mge4 db "La resta es: $"             ; Sub
Mge5 db "La multiplicacion es: $"    ; Mul
Mge6 db "La division es: $"          ; Div
Mge7 db "El modulo o residuo es: $"  ; Residuo
Mge8 db "La exponenciacion es: $"
                          
A db 3,?,3 dup (24h)
B db 3,?,3 dup (24h)
R db 3,?,3 dup (24h)
Salto db 10, 13, 24h
                        
.STACK
END Inicio