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

IMPRIME Mge1
LEER  A
IMPRIME Salto

IMPRIME Mge2
LEER B
IMPRIME Salto


xor Ax, Ax 
mov Ah, A + 2
mov Al, B + 2 
CMP Ah, Al

jna Fin 

add Ah, Al
mov C+2, Ah

IMPRIME Mge3
IMPRIME Salto
IMPRIME C+2

 
Fin:
mov Ax, 4C00h
int 21h


.DATA
                          
Mge1 db "Valor de A: $"
Mge2 db "Valor de B: $"
Mge3 db "La suma es $"

A db 8, ?, 8 dup (24h)
B db 8,?, 8 dup (24h)   
C db 8,?, 8 dup (24h)                     
                     
                    
Salto db 10, 13, 24h
                        
.STACK
END Inicio