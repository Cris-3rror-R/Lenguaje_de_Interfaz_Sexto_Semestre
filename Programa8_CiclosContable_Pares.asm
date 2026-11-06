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


mov Cx, 10
mov A, 30h

;Add A, 1    ;Sentencia para aumentar en uno usando el ADD
;Inc A        ;Sentencia para aumnetar en ++ una variables

FinCiclo:
Add A, 1
Mov Al, A
Test Al, 1 
jnz AuxPar


IMPRIME A
IMPRIME Salto


AuxPar:
Loop FinCiclo

mov Ax, 4C00h
int 21h


.DATA

Mge1 db "Valor de A$"
                          
A db 3 dup (24h)
B db 3
Salto db 10, 13, 24h
                        
.STACK
END Inicio