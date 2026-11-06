; Estudiante: Venegas Venegas Cristopher Axel

; Imprime MENSAJE con el servicio 09h usando un MACRO
IMPRIME Macro Mensaje 
    mov Ah, 09h
    mov Dx, offset Mensaje
    int 21h
ENDM

; Posiciona la CADENA de manera centrada y en la FILA deseada
POSICIONA Macro Cadena, Linea

    mov Dx, offset Cadena 
    mov Si, Dx 
    add Si, 1   

    mov Ah, byte ptr [Si]
    mov Columna, 80  
    sub Columna, Ah

    xor Ax, Ax        
    mov Al, Columna 

    mov Bl, 2   
    div Bl          
    mov Columna, Al

    mov Dh,Linea
    mov Dl,Columna
    mov Bh,0
    mov Ah,2
    int 10h
ENDM 

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

IMPRIME Mge1
LEER  A
IMPRIME Salto

IMPRIME Mge2
LEER B
IMPRIME Salto

IMPRIME Mge6
LEER C
IMPRIME Salto

                      ; if (A > B) && <A > C> Imprimir ("Mayor A")
                      ; if (B > A) && <B > C> Imprimir ("Mayor B")
                      ; if (C > B) && <C > B> Imprimir ("Mayor C")
                      ; TAREA: Hace las comparaciones correspodientes para todos los casos que puedan existir
                      ;        Es decir si todos son iguales, dos iguales y decir quienes son y el tercero cual
                      ;        es su relacion es decir si X es Mayor o menor referente.


xor Ax, Ax
mov Ah,[A+2]
mov Al,[B+2] 
CMP Ah, Al
je IgualAB
ja AuxA
jb AuxB

IgualAB:
xor Ax, Ax
mov Ah,[A+2]
mov Al,[C+2] 
CMP Ah, Al
je Iguales
IMPRIME Mge8
IMPRIME Salto
ja MenorC
jb MayorC


IgualAC:
xor Ax, Ax
mov Ah,[A+2]
mov Al,[B+2] 
CMP Ah, Al
je Iguales
IMPRIME Mge9
IMPRIME Salto
ja MenorB
jb MayorB


IgualBC:
xor Ax, Ax
mov Ah,[B+2]
mov Al,[A+2] 
CMP Ah, Al
je Iguales
IMPRIME Mge10
IMPRIME Salto
ja MenorA
jb MayorA


AuxA:
xor Ax, Ax
mov Ah,[A+2]
mov Al,[C+2] 
CMP Ah, Al
je IgualAC

xor Ax, Ax
mov Ah,[B+2]
mov Al,[C+2] 
CMP Ah, Al
je IgualBC

xor Ax, Ax
mov Ah,[A+2]
mov Al,[C+2] 
CMP Ah, Al
ja MayorA
jb MayorC


AuxB:
xor Ax, Ax
mov Ah,[B+2]
mov Al,[C+2] 
CMP Ah, Al
je IgualBC

xor Ax, Ax
mov Ah,[A+2]
mov Al,[C+2] 
CMP Ah, Al
je IgualAC

xor Ax, Ax
mov Ah,[B+2]
mov Al,[C+2] 
CMP Ah, Al
ja MayorB
jb MayorC


MayorA:             ;Para cuando A es mayor
IMPRIME Mge3

jmp Fin

MayorB:             ;Para cuando B es mayor
IMPRIME Mge4

jmp Fin
 
MayorC:             ;Para cuando C es mayor
IMPRIME Mge7

jmp Fin

MenorA:             ;Para cuando A es menor
IMPRIME Mge12

jmp Fin
 
MenorB:             ;Para cuando B es menor
IMPRIME Mge13

jmp Fin

MenorC:             ;Para cuando C es menor
IMPRIME Mge14

jmp Fin


Iguales:            ;Para cuando los tres numeros sean iguales
IMPRIME Mge5
jmp Fin


Fin:
mov Ax, 4C00h
int 21h


.DATA
                          
Mge1 db "Valor de A: $"
Mge2 db "Valor de B: $"
Mge6 db "Valor de C: $"
Mge3 db "El valor A es mayor $"
Mge4 db "El valor B es mayor $"
Mge7 db "El valor C es mayor $"
Mge5 db "Son iguales $"

Mge8 db "A y B son iguales $"
Mge9 db "A y C son iguales $"
Mge10 db "B y C son iguales $"

Mge12 db "El valor A es menor $"
Mge13 db "El valor B es menor $"
Mge14 db "El valor C es menor $"


A db 5,?,5 dup (24h)
B db 5,?,5 dup (24h)
C db 5,?,5 dup (24h)   
                    
                    
Salto db 10, 13, 24h
                        
.STACK
END Inicio