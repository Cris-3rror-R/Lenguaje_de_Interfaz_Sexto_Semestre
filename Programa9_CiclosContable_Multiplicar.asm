; Estudiante: Venegas Venegas Cristopher Axel

; Imprime MENSAJE con el servicio 09h usando un MACRO
IMPRIME Macro Mensaje 
    mov Ah, 09h
    mov Dx, offset Mensaje
    int 21h
ENDM

; Leer algo
LEER Macro Entrada
    mov Ah,0Ah
    mov Dx, offset Entrada
    int 21h
ENDM


; Limpiar pantalla
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


IMPRIME Mge1
Leer A
mov A+3, "$"
mov B+3, "$"
IMPRIME Salto

mov Al, A+2 
sub Al, 30h     
mov Bl, Al      

mov Cx, 10      
mov Bh, 1       

FinCiclo:
mov Al, Bl 
mul Bh
mov B, bh      
add Al, 30h
mov R, Al

IMPRIME A+2
IMPRIME Mge2
IMPRIME B+2
IMPRIME Mge3
IMPRIME R
IMPRIME Salto

add bh, 1
loop FinCiclo

mov Ax, 4C00h
int 21h


.DATA

Mge1 db "Ingrese la tabla de multiplicar: $"
Mge2 db " x $"
Mge3 db "= $"


                          
A db 3,?,3 dup (24h)
B db 3,?,3 dup (24h)
Aux db 3,?,3 dup (24h)
R db 3
Salto db 10, 13, 24h
                        
.STACK
END Inicio