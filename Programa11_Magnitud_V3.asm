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

; Potencia una base por un exponenente, el LOCAL es para evitar que se dupliquen
POTENCIA Macro Base, Exp
    LOCAL Calcular1, Calcular2, Calcular, FinM 
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
mov Sum+2, 0      
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
add Sum+2, Al
inc E+2
dec Si
loop Ciclo


;Ciclo para poder imprimir el valor en decimal, mejor dicho el INFIERNO
mov E+2, 2       
mov Cx, 3           
mov Si, offset AuxR+2

CicloInverso:
push Cx     
POTENCIA B+2, E+2
    
xor Ax, Ax
mov Al, Sum+2  
mov Bl, R+2 
div Bl  

add Al, 30h
mov [Si], Al  
inc Si

mov Sum+2, Ah   
dec E+2
    
pop Cx       
loop CicloInverso
mov [Si], 24h
IMPRIME AuxR 

Fin:
mov Ax, 4C00h
int 21h

.DATA
    
Salto db 10, 13, "$"
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