; Imprime MENSAJE con el servicio 09h usando un MACRO, este MACRO se realizo en clase
IMPRIME Macro Mensaje 
    mov Ah, 09h
    mov Dx, offset Mensaje
    int 21h
ENDM

; Leer una variable con el servicio 0Ah usando un MACRO, este MACRO se realizo en clase
LEER Macro Entrada
    mov Ah,0Ah
    mov Dx, offset Entrada
    int 21h
ENDM


POTENCIA Macro Base, Exp
    Cmp Exp,0
    jne Calcular1
    mov R+2,1
    jmp FinM
    
    Calcular1:
    Cmp Exp,1
    jne Calcular2
    mov R+2, 10
    jmp FinM
    
    Calcular2:
    xor Cx, Cx
    mov Cl, Exp 
    dec Cx
    xor Ax, Ax
    mov Al, Base
    
    Calcular:
    mul Base
    loop Calcular
    mov R+2, Al   
    
    FinM:
ENDM

.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa

IMPRIME Mge1
LEER Num
IMPRIME Salto

xor Cx, Cx   
mov Cl, [Num+1]
mov Sum,0
mov Si, offset Num+2
add Si, Cx
dec Si
mov E+2, 0
mov B+2, 10
 

Ciclo:
push Cx
POTENCIA B+2, E+2
pop Cx

xor Ax, Ax
mov Al, [Si]
sub Al, 30h
mul R+2 
add Sum, Al
inc E+2
dec Si

loop Ciclo
IMPRIME Sum

;Toca el infierno aca
xor Cx, Cx   
mov Cl, [Num+1]
mov Si, offset Num+2
add Si, Cx
dec Si
mov E+2, 0
mov B+2, 10

CicloResta:
push Cx
POTENCIA B+2, E+2
pop Cx

xor Ax, Ax
mov Al, [Si]
sub Al, 30h

div R+2 
add Sum, Al
inc E+2
dec Si

xor Ax, Ax
mov Al, Sum + 2

mov Bl, R + 2
div Bl

push Ah

add Al, 30h
mov AuxR, Al
IMPRIME Mge6
IMPRIME R 
 
pop Ah 
add Ah, 30h
mov Sum, Ah
IMPRIME Sum
loop CicloResta


Fin:
mov Ax, 4C00h
int 21h

.DATA

Salto db 10, 13, 24h
Mge1 db "Valor de Num: $"
Num db 8,?,8 dup (24h)
R db 8,?,8 dup (24h)
B db 8,?,8 dup (24h)
E db 8,?,8 dup (24h)
Sum db 8,?,8 dup (24h)


Aux db 8,?,8 dup (24h)
AuxR db 8,?,8 dup (24h)


.STACK
END Inicio