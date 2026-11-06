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
    add Si, 1   ; Movemos DX a la direccion del byte 1 

    mov Ah, byte ptr [Si]
    mov Columna, 80  
    sub Columna, Ah

    xor Ax, Ax      ; Pone a cero a Ax o sea Ax=0  
    mov Al, Columna ; Pasamos valor de Columna a Ax

    mov Bl, 2   
    div Bl          ; Al contiene el resultado de la division o sea la columna
    mov Columna, Al ; Columna contiene la columna

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
LEER Nom
IMPRIME Salto
IMPRIME Salto

IMPRIME Mge2
LEER Eda
IMPRIME Salto
IMPRIME Salto

IMPRIME Mge3
LEER Sem
IMPRIME Salto
IMPRIME Salto

IMPRIME Mge4
LEER Car
IMPRIME Salto
IMPRIME Salto

IMPRIME Mge5
LEER NNC
IMPRIME Salto
IMPRIME SaltO

CLS

POSICIONA Nom,3
IMPRIME Nom+2

POSICIONA Eda 5
IMPRIME Eda+2

POSICIONA Sem 7
IMPRIME Sem+2

POSICIONA Car,9
IMPRIME Car+2

POSICIONA NNC,11
IMPRIME NNC+2


mov Ax, 4C00h
int 21h


.DATA
                          
Mge1 db "Cual es tu nombre: $"
Mge2 db "Cual es tu edad: $"
Mge3 db "En que semestre vas: $"
Mge4 db "Que carrera estudias: $"
Mge5 db "Cual es tu numero de control: $"

Nom db 20, ?, 20 dup (24h)
Eda db 20,?, 20 dup (24h)
Sem db 20,?, 20 dup (24h)
Car db 20,?, 20 dup (24h)
NNC db 20,?, 20 dup (24h)   
                    
                    
Salto db 10, 13, 24h
Columna db 2 dup (24h)
                        
.STACK
END Inicio