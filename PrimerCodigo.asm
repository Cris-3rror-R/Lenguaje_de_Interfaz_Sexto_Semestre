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


.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa
















mov Ax, 4C00h
int 21h

.DATA



; Declaracion de vatiables 

.STACK
END Inicio